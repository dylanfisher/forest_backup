class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_body_classes, :set_page_title
  before_action :authentication_check

  private

    def set_body_classes
      classes = []
      classes << "controller--#{controller_name}"
      classes << "action--#{action_name}"
      @body_classes = classes.join ' '
    end

    def set_page_title
      @page_title = controller_name.titleize
    end

    def authentication_check
      unless controller_name == 'public' || action_name == 'show'
        authenticate_user!
      end
    end
end
