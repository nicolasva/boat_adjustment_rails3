class ApplicationController < ActionController::Base
  before_filter :authenticate_user! 
  before_filter :set_locale
  layout :layout
  protect_from_forgery

  def layout
    Rails.logger.info request
    case request.path.split("/")[1]
      when "computer" 
        cookies[:layout] = "computer"
      when "mobile"
        cookies[:layout] = "mobile"
      else
        cookies[:layout] = "computer"
    end
    return cookies[:layout]
  end

  def set_locale
    lang = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    if lang.match /^(en|fr)$/
      I18n.locale = lang
    else
      I18n.locale = 'en'
    end
  end

end
