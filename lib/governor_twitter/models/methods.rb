require 'twitter'
module GovernorTwitter
  module Models
    module Methods
      def post_to_twitter(url=nil)
        shortened_url = url.present? ? Shortie::Service.find_by_key("bitly").shorten(url) : ''
        text = self.description.present? ? self.description : self.title
        Twitter.update("#{truncate(text, :length => 139 - shortened_url.size)} #{shortened_url}")
      end
      
      def post_to_twitter_in_background(url)
        run_in_background :post_to_twitter, url
      end
    end
  end
end