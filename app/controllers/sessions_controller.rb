class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)   
    new_profile_path
  end
end