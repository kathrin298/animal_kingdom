class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # include pundit
  # after action :verify... pundit commands here


  ## This is to sanitize in case you'd like to add anything else to the
  ## signup page e.g. first name, etc. (this was added by John)
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # def configure_permitted_parameters
    ## For additional fields in app/views/devise/registrations/new.html.erb
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    ## For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  # end
end
