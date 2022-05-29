module Contactable 
    def contact_details
        puts 'Enter number to list specific users or (*) to list all:'
        a = gets.chomp
        if a == "*"
            File.open('./../classes/file.txt', 'r') do |f|
                while line = f.gets
                puts line
                end
            end
        elsif a =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
            File.open('./../classes/file.txt', 'r') do |f|
                lines = a.to_i.times.map { f.readline }
            end
        else 
            puts "Enter * to get all lines or valid number for lines"
            contact_details()
        end
    end 
end 

