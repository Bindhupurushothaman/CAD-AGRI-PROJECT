class ApplicationController < ActionController::Base
	 protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :update_last_seen_at, if: -> { user_signed_in? && (current_user.last_seen_at.nil? || current_user.last_seen_at < 5.minutes.ago) }

def update_last_seen_at
	logger.info "Last seen timestamp for customer #{current_user.id}"
	current_user.update_attribute(:last_seen_at, Time.current)
end	
 
def after_sign_in_path_for(resource)
	"/signedinuserprofile"
end

 include ApplicationHelper
 
	protected
#permitting few attributes in the devise default parameters
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:update, keys: [:first_name, :last_name, :phone, :url])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
    end	

end
