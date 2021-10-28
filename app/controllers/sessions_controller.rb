class SessionsController < Devise::SessionsController
  protected
  def after_sign_in_path_for(resource)
    if current_freelancer.profile.blank?
      new_profile_path
    end
  end
end