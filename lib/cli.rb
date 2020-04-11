class CLI
    
    def call_cli
        puts ""
        puts "*******************************************************************"
        puts "Welcome to the APOD (Astronomy Picture of the Day) Birthday Finder!"
        puts "*******************************************************************"
        sleep(1)
        input_date
    end
    
    def input_date
        
        puts ""
        puts "What is your birth-year? (Format: 'YYYY')"
        user_year = gets.strip
            until user_year !~ /\D/ 
                puts "**ERROR** '#{user_year}' is an invalid year input. Please re-enter your birth-year. (Format: 'YYYY')"
                user_year = gets.strip
            end
            # until user_year.include?(" ")
            #     puts "**ERROR** Blank spaces are an invalid year input. Please re-enter your birth-year. (Format: 'YYYY')"
            #     user_year = gets.strip
            # end
            until user_year.length == 4
                puts "**ERROR** '#{user_year}' is an invalid year input. Please re-enter your birth-year. (Format: 'YYYY')"
                user_year = gets.strip
            end
            until user_year.to_i < Date.today.year+1
                puts "Unfortunately, this API does not predict future information. Tell me ... what is the future like time-traveler? Your birth-year has been set to #{Date.today.year}!"
                user_year = Date.today.year
            end
            if user_year.to_i < 1995
                puts "Unfortunately, this API does not contain information before 1995. Congratulations on finding the fountain of youth you old geezer! Your birth-year has been set to the default of 1996!"
                user_year = 1996
            end
        
        puts ""
        puts "What is your birth-month? (Format: 'MM')"
        user_month = gets.strip
            until user_month !~ /\D/ 
                puts "**ERROR** '#{user_month}' is an invalid input. Please re-enter your birth-month. (Format: 'MM')"
                user_month = gets.strip
            end
            # until user_month.include?(" ")
            #     puts "**ERROR** Blank spaces are an invalid year input. Please re-enter your birth-month. (Format: 'MM')"
            #     user_month = gets.strip
            # end
            until user_month.length == 2
                puts "**ERROR** '#{user_month}' is an invalid input. Please re-enter your birth-month. (Format: 'MM')"
                user_month = gets.strip
            end
            until user_month.to_i <= 12
                puts "**ERROR** '#{user_month}' is an invalid input. Please re-enter your birth-month. (Format: 'MM', up to 12)"
                user_month = gets.strip
            end
        
        puts ""
        puts "What is your birth-day? (Format: 'DD')"
        user_day = gets.strip
            until user_day !~ /\D/ 
                puts "**ERROR** '#{user_day}' is an invalid input. Please re-enter your birth-day. (Format: 'DD')"
                user_day = gets.strip
            end
            # until user_day.include?(" ")
            #     puts "**ERROR** '#{user_day}' is an invalid input. Please re-enter your birth-day. (Format: 'DD')"
            #     user_day = gets.strip
            # end
            until user_day.length == 2
                puts "**ERROR** '#{user_day}' is an invalid input. Please re-enter your birth-day. (Format: 'DD')"
                user_day = gets.strip
            end
            until user_day.to_i <= 31
                puts "**ERROR** '#{user_day}' is an invalid input. Please re-enter your birth-day. (Format: 'DD', up to 31)"
                user_day = gets.strip
            end
        
        user_date = "#{user_year}-#{user_month}-#{user_day}"

        if Date.valid_date?(user_year.to_i,user_month.to_i,user_day.to_i) == false
            puts "**ERROR** The date of #{user_date} is invalid or does not exist. Please re-submit."
            input_date
            abort
        # elsif user_year.to_i == Date.today.year && user_month.to_i < Date.today.month || user_day.to_i < Date.today.day
        #     puts "**ERROR** The date of #{user_date} is invalid or does not exist. Please re-submit."
        #     input_date
        #     abort
        else
            puts ""
            puts "*****************************************"
            puts "The day entered is: #{user_date}."
            puts "*****************************************"
            puts ""
        end

        API.new.call_api(user_date)   
    end

end