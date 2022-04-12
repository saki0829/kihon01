class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :login_required

    def login_required
        redirect_to login_url unless current_user
    end
end