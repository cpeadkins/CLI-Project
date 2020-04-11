class API
    #call picture.rb class in this file
    def call_api(user_date)
        resp = RestClient.get("https://api.nasa.gov/planetary/apod?api_key=MbbbqMtQzgF1Hcsg4oz8kTdUH23FsPQgMQsyo9gs&date=#{user_date}")
        query_hash = JSON.parse(resp.body,symbolize_names:true)
        query_date = query_hash[:date]
        query_title = query_hash[:title]
        query_explanation = query_hash[:explanation]
        # query_url = query_hash[:url] # Added this to picture class for academic proof.
        puts ""
        puts "Date: #{query_date}"
        puts "Title: #{query_title}"
        puts "Description: #{query_explanation}"
        # puts "Image URL: #{query_url}" # Added this to picture class for academic proof.

        Picture.new(query_hash[:url])
    end

end