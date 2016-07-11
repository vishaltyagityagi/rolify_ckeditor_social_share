class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:login]

         def self.from_omniauth(auth)
           where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
             user.provider = auth.provider
             user.uid      = auth.uid
             user.name     = auth.info.name
             user.save
           end
         end

         def self.find_first_by_auth_conditions(warden_conditions)
           conditions = warden_conditions.dup
           if login = conditions.delete(:login)
             where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
           else
             where(conditions).first
           end
         end

          # def self.role_type(role_type)
          #   @role=Role.find_by(name: role_type)
          #   if  @role.name== "teacher"
          #     UserMailer.teacher_mailer(@message).deliver_now
          #   elsif  @role.name == "student"
          #      UserMailer.student_mailer(@message).deliver_now
          #     end

          # end

end
