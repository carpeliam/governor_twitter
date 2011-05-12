module GovernorTwitter
  module Controllers
    module Methods
      def self.included(c)
        c.after_filter :send_to_twitter, :only => [:create, :update]
      end
      
      def send_to_twitter
        resource.post_to_twitter_in_background(polymorphic_url(resource))
      end
    end
  end
end