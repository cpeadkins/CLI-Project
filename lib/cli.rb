class CLI
    def call_cli
        puts "Welcome to the APOD (Astronomy Picture of the Day) Birthday Finder!"
        input_date
        # API.new.call_api
    end
    
    def input_date
        
        puts ""
        puts "What is your birth-year? (Format: 'YYYY')"
        user_year = gets.strip
            until user_year !~ /\D/ #Is there a way to avoid empty space? Invalid.
                puts "'#{user_year}' is an invalid year input. Please re-enter your birth-year. (Format: 'YYYY')"
                user_year = gets.strip
            end
            until user_year.length == 4
                puts "'#{user_year}' is an invalid year input. Please re-enter your birth-year. (Format: 'YYYY')"
                user_year = gets.strip
            end
            if user_year < 1995
                puts "Unfortunately, this API does not contain information before 1995. Congratualations on finding the fountain of youth! Your birthyear is now set to 1996!"
                user_year = 1996
            elseif user_year > Date.today.year + 1
                puts "Unfortunately, this API does not predict future information. Tell me ... what is the future like? Your birthyear has been set to #{Date.today.year}!"
                user_year = Date.today.year
            end
        
        puts ""
        puts "What is your birth-month? (Format: 'MM')"
        user_month = gets.strip
        
        puts ""
        puts "What is your birth-day? (Format: 'DD')"
        user_day = gets.strip
        
        user_date = "#{user_year}-#{user_month}-#{user_day}"
        API.new.call_api(user_date)
    end
  
    def check_input(user)
        str !~ /\D/
    end

end