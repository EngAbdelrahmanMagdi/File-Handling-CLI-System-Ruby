require './person.rb'
require './../modules/contactable.rb'

class User < Person
    extend Contactable
    attr_accessor :email, :mobile 

    #instance variable
    @email 
    @mobile

    def initialize (name,email, mobile)
        super(name)
        @email = email 
        @mobile = mobile 
    end 
    
    def valid_mobile?(mobile)
        puts "Enter Your Mobile Number"
        mobile_taken = gets.chomp 
        if /^01[0125][0-9]{8}$/.match(mobile_taken)
        puts "The Mobile Number #{mobile_taken} is valid"
        @mobile = mobile_taken
        puts "Welcome #{name}"
        else 
            puts "You've entered wrong name, Try again"
            valid_mobile?(mobile)
        end
    end

    def valid_email?(email)
        puts "Enter Email"
        email_taken = gets.chomp 
        if /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/.match(email_taken)
        puts "The email #{email_taken} is valid"
        @email = email_taken
        else 
            puts "You've entered wrong email, Try again"
            valid_email?(email)
        end
    end

    def create 
        File.open('file.txt', 'a') do |f|
        f.puts "#{name}: #{email} | #{mobile}"
        end
        super

    end
    
    def self.list
        str = contact_details
        puts str
    end 
end 

object = User.new("Body","boduy@gmail.com", "01004065701")

# object.valid_name?("abdelrahman")
# object.valid_email?("abdo@gmail.com")
# object.valid_mobile?("01094073251")
# object.create 
# User.list

while true
    puts('Press 1 to create user and 2 to USE ALL list methods and 0 to exit')
    case_number = gets.to_i
    case case_number
    when 1
        object.valid_name?("abdelrahman")
        object.valid_email?("abdo@gmail.com")
        object.valid_mobile?("01094073251")
        object.create 
    when 2
        User.list
    when 0 
        exit
    end
end