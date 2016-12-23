class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_html_classes, :set_page_title

  private

    def set_html_classes
      classes = []
      classes << "controller--#{controller_name}"
      classes << "action--#{action_name}"
      @html_classes = classes.join ' '
    end

    def set_page_title
      @page_title = controller_name.titleize
    end
end
