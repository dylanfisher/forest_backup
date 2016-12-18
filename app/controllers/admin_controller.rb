class AdminController < ApplicationController
  def index
    # TODO: authorization
    @resources = [Page, Menu]
  end
end
