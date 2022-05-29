class Person
    attr_accessor :name
    #Class variable
    @@persons_num = 0
    #instance variable
    @name

    def initialize(name)
        @name = name
    end


    #instance methods
    def valid_name?(name)
        puts "Enter Name"
        name_taken = gets.chomp 
        if /^[a-zA-Z ]*$/.match(name_taken)
        puts "The Name #{name_taken} is valid"
        @name = name_taken
        else 
            puts "You've entered wrong name, Try again"
            valid_name?(name)
        end
    end

    #getters
    
    def self.persons_num
        @@persons_num
    end

    def create
        @@persons_num += 1
        self
    end
    
end


