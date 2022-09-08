class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :is_editing_form, only: %i[edit update]

  def set_locale
    if params[:locale]
      cookies[:locale] = params[:locale]
    end

    if cookies[:locale]
      if I18n.locale != cookies[:locale]
        I18n.locale = cookies[:locale]
      end
    end
  end

  private
    def is_editing_form
      @editing_form = true
    end
    
end
