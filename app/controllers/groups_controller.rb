class GroupsController < ApplicationController
  before_action :require_login, only: [:new]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_create_param)
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
    @group = Group.order('id DESC').limit(10)
  end

  private

  def group_member_param
    params.require(:group).permit(:id)
  end

  def group_create_param
    params.require(:group).permit(:name, :description)
  end
end
