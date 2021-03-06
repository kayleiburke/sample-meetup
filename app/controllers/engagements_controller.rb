class EngagementsController < ApplicationController
  before_action :set_engagement, only: [:show, :edit, :update, :destroy]

  # GET /engagements
  # GET /engagements.json
  def index
    @engagements = Engagement.all
  end

  # GET /engagements/1
  # GET /engagements/1.json
  def show
  end

  # GET /engagements/new
  def new
    @engagement = Engagement.new
    group ||= Group.find_by_id(params[:group])
    if !group
      if Group.first
        group = Group.first
      end
    end
    @engagement.group = group
  end

  # GET /engagements/1/edit
  def edit
  end

  # POST /engagements
  # POST /engagements.json
  def create
    @engagement = Engagement.new(engagement_params)

    respond_to do |format|
      if @engagement.save
        format.html { redirect_to edit_group_path(@engagement.group), notice: 'Engagement was successfully created.' }
        format.json { render :show, status: :created, location: @engagement }
      else
        format.html { render :new }
        format.json { render json: @engagement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engagements/1
  # PATCH/PUT /engagements/1.json
  def update
    respond_to do |format|
      if @engagement.update(engagement_params)
        format.html { redirect_to @engagement, notice: 'User group was successfully updated.' }
        format.json { render :show, status: :ok, location: @engagement }
      else
        format.html { render :edit }
        format.json { render json: @engagement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engagements/1
  # DELETE /engagements/1.json
  def destroy
    group = @engagement.group
    @engagement.destroy
    respond_to do |format|
      format.html { redirect_to edit_group_path(group), notice: 'Engagement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engagement
      @engagement = Engagement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def engagement_params
      params.require(:engagement).permit(:user_id, :group_id, :role)
    end
end
