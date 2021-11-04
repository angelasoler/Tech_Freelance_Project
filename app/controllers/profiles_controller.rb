class ProfilesController < ApplicationController
  before_action :authenticate_freelancer!, only: [:new, :create]
  def show
    @profile = Profile.find(params[:id])
  end
  
  def new
    if current_freelancer.profile.nil?
      @profile = Profile.new
    else
      redirect_to root_path
    end
  end

  def create
    @profile = Profile.create(profile_params)
    @profile.freelancer = current_freelancer
    
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
                                    :work_experience, :photo
                                   )
  end
end