module GovernorTwitter
  module Controllers
    module Methods
      def self.included(c)
        c.after_filter :send_to_twitter, :only => [:create, :update]
      end
      
      def send_to_twitter
        if params[:post_to_twitter] && resource.errors.blank?
          resource.post_to_twitter_in_background(params[:twitter_content], polymorphic_url(resource))
        end
      end
    end
  end
end