class AdminController < ApplicationController
  def index
    # TODO: authorization
    @resources = [Page, Menu, MediaItem]
  end
end
