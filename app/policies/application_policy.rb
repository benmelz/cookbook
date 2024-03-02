# frozen_string_literal: true

class ApplicationPolicy < ActionPolicy::Base
  authorization_targets.delete(:user)
end
