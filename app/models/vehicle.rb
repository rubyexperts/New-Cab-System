class Vehicle < ActiveRecord::Base
    
   validates :name, :presence => true, :length => { :maximum => 70 }
   validates :taxi_number, :presence => true, :uniqueness => true, :length => { :maximum => 70 } 
   
end


#~/.rvm/rubies/ruby-1.9.2-p290/bin/ruby

#export RUBYLIB=/home/ec2-user/.rvm/src/ruby-1.9.2-p290/lib/rubygems

