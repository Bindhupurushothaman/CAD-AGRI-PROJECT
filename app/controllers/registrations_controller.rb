class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

def create
  verify_recaptcha(model: @user)
end

  private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        set_minimum_password_length
        respond_with_navigational(resource) { render :new }
      end 
    end
end