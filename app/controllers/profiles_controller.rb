class ProfilesController < ApplicationController
  # before_action :authenticate_freelancer!, only: [:new, :create]
  def show
    @profile = Profile.find(params[:id])
  end
  
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
    @profile.freelancer = current_freelancer
    @profile.photo.attach(params[:photo])
    if @profile.save
      redirect_to profile_path(@profile.id)
    else
      render :new
    end
  end

  def profile_params
    params.require(:profile).permit(:full_name, :social_name, 
                                    :birth_date, :educational_background, 
                                    :work_field, :about_me, 
                                    :work_experience
                                   )
  end

  def my_profile
    @my_profile = current_freelancer.profile
  end
end