class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user! # before any action in UI we need an logged in user
end
