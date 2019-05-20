class GroupsController < ApplicationController
  before_action :require_login, only: [:new]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_param)
    @group.owner = current_user
    if @group.save
      redirect_to group_path(@group)
    else
      render 'groups/new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @owner = @group.owner
  end

  def index
    @groups = Group.order('id DESC').limit(10)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update_attributes(group_param)
    if group.valid?
      group.save
      redirect_to group_path(group.id)
    else
      redirect_to edit_group_path(group.id)
    end
  end

  private

  def group_member_param
    params.require(:group).permit(:id)
  end

  def group_param
    params.require(:group).permit(:name, :description)
  end
end
