require 'spec_helper'

describe Article do
  before do
    @content = "Visit my site!"
    @url = 'http://blago.gov/money_please'
    @shortened_url = 'http://bit.ly/short'
    @article = Factory(:article, :author => Factory(:user))
  end
  it "can post to twitter" do
    Shortie::Service.find_by_key("bitly").expects(:shorten).with(@url).returns(@shortened_url)
    Twitter.expects(:update).with("#{@content} #{@shortened_url}")
    @article.post_to_twitter @content, @url
  end
end