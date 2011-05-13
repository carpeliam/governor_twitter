require 'spec_helper'

describe GovernorTwitter do
  it "registers the plugin" do
    Governor::PluginManager.plugins.size == 1
  end
end
