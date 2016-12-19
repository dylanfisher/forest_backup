class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_html_classes

  private

    def set_html_classes
      classes = []
      classes << "controller--#{controller_name}"
      classes << "action--#{action_name}"
      @html_classes = classes.join ' '
    end
end
