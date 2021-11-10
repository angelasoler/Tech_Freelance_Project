class CustomFailure < Devise::FailureApp
  def redirect_url
     root_url
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
      flash[:alert] = ' URLS não atorizada.' 
    end
  end
end