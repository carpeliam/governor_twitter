require 'spec_helper'

describe GovernorTwitter do
  it "registers the plugin with Governor" do
    Governor::PluginManager.plugins.size == 1
  end
  
  it "registers a job with GovernorBackground" do
    GovernorBackground.retrieve('twitter_post').should_not be_blank
  end
  
  it "can post to twitter" do
    content = "Visit my site!"
    url = 'http://blago.gov/money_please'
    shortened_url = 'http://bit.ly/short'
    Shortie::Service.find_by_key("bitly").expects(:shorten).with(url).returns(shortened_url)
    Twitter.expects(:update).with("#{content} #{shortened_url}")
    GovernorBackground.run('twitter_post', content, url)
  end
end
