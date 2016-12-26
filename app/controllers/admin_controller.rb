class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize :dashboard, :index?
    @resources = [Page, Menu, MediaItem, User, UserGroup]
  end
end
