class User < ActiveRecord::Base

   attr_accessor :password

   attr_accessible :type, :first_name, :last_name, :mobile_number, :licence_number, :email, :password, :password_confirmation
   
   has_many :bookings

   validates :first_name, :presence => true, :length => { :maximum => 70 }, :if => :first_name
   validates :last_name, :presence => true, :length => { :maximum => 70 }, :if => :last_name
   
   validates :mobile_number, :presence => true,  :if => :mobile_number
   
   validates :email, :presence => true, :uniqueness => true,
                      :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i},
                      :if => :email
   
   # user will be able to edit her profile without providing password
   validates_presence_of :password, :if => :password #, :on => :create,
   validates_confirmation_of :password, :allow_blank => true
   validates_length_of :password, :within => 6..40, :allow_blank => true
   
   before_save :prepare_password
   before_create { generate_token(:remember_token) }
   before_create { generate_token(:confirmation_token) }
   after_create { send_confirmation_instructions }
   
   def self.authenticate(email, pass)
     user = where('email = ? AND confirmed_at IS NOT NULL', email).first
     return user if user && user.password_hash == user.encrypt_password(pass)
   end
   
   def send_confirmation_instructions
     puts "Send Instructions".inspect
	  generate_token(:confirmation_token) if self.confirmation_token.nil?
	  self.confirmation_sent_at = Time.zone.now
	  save!
	  UserMailer.confirmation_instructions(self).deliver
   end   
      
   def encrypt_password(pass)
     puts "Encrypt Password".inspect
	  BCrypt::Engine.hash_secret(pass, password_salt)
   end
   
   def confirmed?
     !!confirmed_at
   end
   
   def confirm!
     self.confirmed_at = Time.zone.now
     save!(:validate => false)
   end
   
   def track_on_login(request)
     self.last_login_at = Time.zone.now
     self.last_login_ip = request.remote_ip
     self.login_count += 1
   end
   
   def track_on_logout
     self.last_logout_at = Time.zone.now
   end
   
   def reset_remember_token
     generate_token(:remember_token)
   end

   def reset_remember_token_and_save
     reset_remember_token
     save!(:validate => false)
   end
   
   def send_password_reset
     generate_token(:password_reset_token)
     self.password_reset_sent_at = Time.zone.now
     save!
     UserMailer.password_reset(self).deliver
   end
   
   def is_passenger?
     self.type == "Passenger"
   end
   
   def is_company?
     self.type == "Company"
   end
   
   def is_driver?
     self.type == "Driver"
   end
  
   private
   
   def prepare_password
     puts "Prepare Password".inspect
	  unless password.blank?
	    self.password_salt = BCrypt::Engine.generate_salt
 	    self.password_hash = encrypt_password(password)
 	  end
   end

   def generate_token(column)
     puts "Generate Token".inspect
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
   end
   
end
