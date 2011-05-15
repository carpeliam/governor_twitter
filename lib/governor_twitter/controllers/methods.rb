module GovernorTwitter
  module Controllers
    module Methods
      def self.included(c)
        c.after_filter :send_to_twitter, :only => [:create, :update]
      end
      
      def send_to_twitter
        if params[:post_to_twitter] && resource.errors.blank?
          content, url = params[:twitter_content], polymorphic_url(resource)
          logger.info 'posting to twitter in the background'
          GovernorBackground.run('twitter_post', content, url)
        end
      end
    end
  end
end