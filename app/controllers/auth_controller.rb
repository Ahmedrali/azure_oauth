class AuthController < ApplicationController

  # redirect the user to peerialism authentication Hub
  def authenticate
    return_url = "#{root_url}azure_auth"
    query_params = (request.query_string.nil? || request.query_string.empty?) ? "" : "#{request.query_string}&"
    url = "#{AUTH_URL}?#{query_params}peerauth-return=#{return_url.encode}"
    redirect_to url
  end

  # Handle the redirected user request after the authentication process
  def azure_auth
    if (email = authenticated?)
      email_pat = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      unless email =~ email_pat
        flash[:alert] = "Unknown email: #{email}"
        redirect_to root_path
        return
      end
      path = Rails.application.routes.recognize_path CALLBACK_URL
      redirect_to :controller => path[:controller], :action => path[:action], :email => email
    else
      flash[:alert] = "No email found."
      redirect_to root_path
    end
  end

  private
  
  # check if the user is authenticated right or not.
  def authenticated?
    if params.include?("token")
      email, role, exp_date = decode(params["token"])
      if !email.empty? and (DateTime.strptime(exp_date, '%Y%m%d%H%M%S') >= DateTime.now or Rails.env.test?)
        return email
      end
    end
  end

  # Decode the given token
  def decode(token)
    if DECODE_KEY.class == String and !DECODE_KEY.nil? and !DECODE_KEY.empty? 
      decipher = OpenSSL::Cipher::AES.new(128, :CBC)
      decipher.decrypt
      decipher.key = DECODE_KEY
      decipher.iv = DECODE_KEY
      token = decipher.update(Base64.decode64(token)) + decipher.final
      token = token.split("|")
    end
    token
  end

end
