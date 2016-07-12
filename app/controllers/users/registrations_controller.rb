class Users::RegistrationsController < Devise::RegistrationsController
	 # before_action :role_type, only: [:create]

  def create
    build_resource(sign_up_params)

    if resource.save
      role_type = params[:role_type]
      if role_type.present?
        
        resource.add_role role_type 
        
      end
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end



  private

  # def role_type
  #   if params[:role_type] == "teacher"
  #   UserMailer.teacher_mailer(@message).deliver_now
  #   elsif params[:role_type] == "student"
  #     UserMailer.student_mailer(@message).deliver_now
  #   end

  # end
  # def role_type
  #   User.role_type(params[:role_type])

  #   end

  def registration_params
    params.require(:user).permit(:login,:email, :username,:firstname, :lastname, :password, :password_confirmation, :remember_me)

  end
end
