class GroupsController < ApplicationController
  load_and_authorize_resource :groups

  def index
    @groups = Group.all.where(user: current_user).includes(:expenses)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_url, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
