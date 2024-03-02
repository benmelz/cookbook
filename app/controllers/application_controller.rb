# frozen_string_literal: true

class ApplicationController < ActionController::Base
  authorization_targets.delete(:user)
  protect_from_forgery
end
