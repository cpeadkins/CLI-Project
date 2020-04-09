require 'pry'
require 'rest-client' # gem that allows us to open/interact with the api
require 'json' # java script object notation, interprets (parses) the response we get back from the api

user_date = "2000-01-12" #temporary date without user input

resp = RestClient.get("https://api.nasa.gov/planetary/apod?api_key=MbbbqMtQzgF1Hcsg4oz8kTdUH23FsPQgMQsyo9gs&date=#{user_date}")
query_hash = JSON.parse(resp.body,symbolize_names:true)
query_date = query_hash[:date]
query_title = query_hash[:title]
query_explanation = query_hash[:explanation]
query_url = query_hash[:url]
binding.pry


# user_year =
# user_month = gets.strip
# user_day = 
# user_date = user_year-user_month-user_day
