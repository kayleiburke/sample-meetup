class GroupsController < ApplicationController
  require 'csv'
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

    @groups = @groups.order("LOWER(" + sort_column(Group) + ') ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
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
    success_message = "The following engagements were created: <ul>"
    error_message = "The following engagements were not created: <ul>"
    begin
      index = 1
      CSV.foreach(params["file"].path, headers: true) do |row|
        begin
          user = User.find_or_create_by(first_name: row[0].strip.capitalize, last_name: row[1].strip.capitalize)
          group = Group.find_or_create_by(name: row[2].strip)
          engagement = Engagement.find_or_create_by(user: user, group: group, role: row[3].strip.downcase)
          success_message = success_message + "<li>" + engagement.stringify + "</li>"
        rescue Exception => e
          error_message = error_message + "<li>Row " + index.to_s + ": " + row.to_s + "</li>"
          error_message = error_message + "<ul><li>" + e.message + "</li></ul>"
          next
        ensure
          index = index + 1
        end
      end

      success_message = success_message + "</ul>"
      error_message = error_message + "</ul>"

      respond_to do |format|
        # user redirect_to rather than rendering the index directly because the index html page relies on instance variables
        format.html { redirect_to groups_path, notice: success_message + error_message }
        format.json { head :no_content }
      end
    rescue Exception => e
      respond_to do |format|
        format.html { redirect_to groups_path, notice: e.message }
        format.json { render json: e.to_s, status: :unprocessable_entity, errors: { count: 1, full_messages: [e.message]}  }
      end
    end
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
