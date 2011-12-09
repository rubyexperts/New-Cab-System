class UserMailer < ActionMailer::Base

    default :from => "from@example.com"
  
    def confirmation_instructions(user)
      @user = user
      mail :to => user.email, :subject => "Confirmation instructions"
    end
    
    def password_reset(user)
      @user = user
      mail :to => user.email, :subject => "Password Reset"
    end
  
end
