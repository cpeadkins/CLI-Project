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
        puts ""
        puts "What is your birth-month? (Format: 'MM')"
        user_month = gets.strip
        puts ""
        puts "What is your birth-day? (Format: 'DD')"
        user_day = gets.strip
        user_date = "#{user_year}-#{user_month}-#{user_day}"
        API.new.call_api(user_date)
    end
  end