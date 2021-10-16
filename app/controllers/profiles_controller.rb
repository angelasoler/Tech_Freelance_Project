class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
  end

  def profile_params
    params.require(:profile).permit(:full_name, :social_name, 
                                    :educational_background, 
                                    :work_field, :about_me, 
                                    :work_experience, :photo
                                    )
  end
end