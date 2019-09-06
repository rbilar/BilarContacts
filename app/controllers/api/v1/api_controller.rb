module Api::V1
  class ApplicationController < ActionController::API
    acts_as_token_authentication_handler_for User
    before_action :require_authnetication!

    private

    def require_authnetication!
      throw(:warden, scope: :user) unless current_user.presence
    end
  end
end