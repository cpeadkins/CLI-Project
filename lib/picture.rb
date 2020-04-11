class Picture
    attr_accessor :url

    def initialize(url)
        @url = url
        display_url
    end

    def display_url
        puts "Image URL: #{@url}"
        puts ""
    end

end