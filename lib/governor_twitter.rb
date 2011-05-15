require 'governor_twitter/rails'
require 'governor_twitter/controllers/methods'

twitter = Governor::Plugin.new('twitter')

twitter.register_controller_callback do |controller|
  controller.send :include, GovernorTwitter::Controllers::Methods
end
twitter.register_partial :bottom_of_form, 'articles/twitter_form'

GovernorBackground.register('twitter_post') do |content, url|
  include ActionView::Helpers::TextHelper
  shortened_url = Shortie::Service.find_by_key("bitly").shorten(url)
  Twitter.update("#{truncate(content, :length => 139 - shortened_url.size)} #{shortened_url}")
end

Governor::PluginManager.register twitter