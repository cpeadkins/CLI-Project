class Picture
    attr_accessor :url

    def initialize(url)
        @url = url
        display_url
    end

    def display_url
        puts "Image URL: #{@url}"
        puts ""
        link = "#{@url}"
            if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
            system "start #{link}"
            elsif RbConfig::CONFIG['host_os'] =~ /darwin/
            system "open #{link}"
            elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
            system "xdg-open #{link}"
            end
    end

end