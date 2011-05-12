require 'governor_twitter/rails'
require 'governor_twitter/models/methods'
require 'governor_twitter/controllers/methods'

twitter = Governor::Plugin.new('twitter')

twitter.register_model_callback do |base|
  base.send :include, GovernorTwitter::Models::Methods
  base.send :include, ActionView::Helpers::TextHelper
end
twitter.register_controller_callback do |controller|
  controller.send :include, GovernorTwitter::Controllers::Methods
end
# twitter.register_partial :bottom_of_form, 'articles/twitter_form'

Governor::PluginManager.register twitter