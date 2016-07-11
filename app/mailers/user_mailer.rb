class UserMailer < ApplicationMailer
  def teacher_mailer(message)
   @message= message
   mail(to: 'vishal_tyagi@seologistics.com', subject: "hello Teacher")
    end

    def student_mailer(message)
     @message= message
     mail(to: 'vishal_tyagi@seologistics.com', subject: "hello student")
      end

end
