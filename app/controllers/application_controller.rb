class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_form
    render "#{params[:controller]}/modal_form"
  end

  def load_begin
    render js: "load_begin();"
  end

  def load_done
    render js: "load_done();"
  end
end
