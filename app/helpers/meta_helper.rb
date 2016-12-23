module MetaHelper
  def page_title
    [content_for(:page_title) || @page_title, site_title].reject(&:blank?).join(divider).html_safe
  end

  def site_title
    Setting.friendly.find('site-title')&.value || default_site_title
  end

  def page_description
    [content_for(:page_description) || @page_description, site_description].reject(&:blank?).first.html_safe
  end

  def site_description
    Setting.friendly.find('description')&.value || default_site_description
  end

  private

    def default_site_title
      'Forest CMS'
    end

    def default_site_description
      'This site was built with the Forest CMS.'
    end

    def divider(spacer = ' &#8211; ')
      spacer
    end
end