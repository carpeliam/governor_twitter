require 'twitter'
module GovernorTwitter
  module Models
    module Methods
      def post_to_twitter(content, url)
        shortened_url = Shortie::Service.find_by_key("bitly").shorten(url)
        Twitter.update("#{truncate(content, :length => 139 - shortened_url.size)} #{shortened_url}")
      end
      
      def post_to_twitter_in_background(content, url)
        run_in_background :post_to_twitter, content, url
      end
    end
  end
end