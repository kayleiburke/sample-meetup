class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /users
  # GET /users.json
  def index
    @users = User.all.order(sort_column(User) + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)
    @columns = [
      {
        field: "first_name",
        editable: true,
        sort_column: "first_name"
      },
      {
        field: "last_name",
        editable: true,
        sort_column: "last_name"
      },
      {
        field: "email",
        editable: true,
        sort_column: "email"
      },
      {
        field: "actions"
      }
    ]
  end

  # GET /users/1
  # GET /users/1.json
  def show
    redirect_to edit_user_path(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @engagement_columns = [
      {
        field: "group",
        sub_field: "name",
        name: "Group",
        editable: false
      },
      {
        field: "group",
        sub_field: "description",
        name: "Description",
        editable: false
      },
      {
        field: "role",
        editable: false
      }
    ]
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if !params[:user][:password].blank?
      params[:user][:password_confirmation] = params[:user][:password]
    else
      params[:user].delete(:password)
    end
    respond_to do |format|
      if @user.update(user_params)
        format.html { render :edit, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
