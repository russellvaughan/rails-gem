require 'rails'
require 'my_gem/railtie' if defined? (Rails)
require_relative "gosquared/trends"
require_relative "gosquared/tracking"
require_relative "gosquared/people"
require_relative "gosquared/now"
require_relative "gosquared/account"

module GoSquared

class RubyClient

  def initialize api_key, site_id
    @api_key = api_key
    @site_id = site_id
  end

  def trends
    @trends ||= Trends.new(@api_key, @site_id)
  end

  def tracking
    @tracking ||= Tracking.new(@api_key, @site_id)
  end

  def people
    @people ||=  People.new(@api_key, @site_id)
  end

  def now
    @now ||= Now.new(@api_key, @site_id)
  end

  def account
    @account ||= Account.new(@api_key, @site_id)
  end

end


  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    block_given? ? yield(configuration) : configuration
  end

  class Configuration
    attr_accessor :site_token
  end

end
