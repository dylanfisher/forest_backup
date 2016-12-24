class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    # TODO: authorization/permissions
    @resources = [Page, Menu, MediaItem]
  end
end
