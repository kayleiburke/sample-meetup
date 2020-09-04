class UserGroupRolesController < ApplicationController
  before_action :set_user_group_role, only: [:show, :edit, :update, :destroy]

  # GET /user_group_roles
  # GET /user_group_roles.json
  def index
    @user_group_roles = UserGroupRole.all
  end

  # GET /user_group_roles/1
  # GET /user_group_roles/1.json
  def show
  end

  # GET /user_group_roles/new
  def new
    @user_group_role = UserGroupRole.new
  end

  # GET /user_group_roles/1/edit
  def edit
  end

  # POST /user_group_roles
  # POST /user_group_roles.json
  def create
    @user_group_role = UserGroupRole.new(user_group_role_params)

    respond_to do |format|
      if @user_group_role.save
        format.html { redirect_to @user_group_role, notice: 'User group was successfully created.' }
        format.json { render :show, status: :created, location: @user_group_role }
      else
        format.html { render :new }
        format.json { render json: @user_group_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_group_roles/1
  # PATCH/PUT /user_group_roles/1.json
  def update
    respond_to do |format|
      if @user_group_role.update(user_group_role_params)
        format.html { redirect_to @user_group_role, notice: 'User group was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_group_role }
      else
        format.html { render :edit }
        format.json { render json: @user_group_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_group_roles/1
  # DELETE /user_group_roles/1.json
  def destroy
    @user_group_role.destroy
    respond_to do |format|
      format.html { redirect_to user_group_roles_url, notice: 'User group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_group_role
      @user_group_role = UserGroupRole.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_group_role_params
      params.fetch(:user_group_role, {})
    end
end
