class StaticPagesController < ApplicationController
  def home
    @groups = Group.order('id DESC').limit(10)
  end
end
