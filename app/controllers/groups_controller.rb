class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /groups
  # GET /groups.json
  def index
    if params[:search]
      @groups = Group.search(params[:search])
    else
      @groups = Group.all
    end

    @groups = @groups.order(sort_column(Group) + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
    @search_term = params[:search].nil? ? "" : params[:search]
    @columns = [
        {
          field: "name",
          editable: true,

        },
        {
            field: "description",
            editable: true
        },
        {
            field: "organizers",
            subField: "full_name",
            editable: false
        },
        {
            field: "actions"
        }
    ]
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    set_columns
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    set_columns
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    set_columns

    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def import

  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :description)
    end

    def set_columns
      @columns = [
          {
              field: "user",
              subField: "full_name",
              editable: false
          },
          {
              field: "role",
              editable: false
          },
          {
              field: "actions",
              hidden: ["show"]
          }
      ]
    end
end
