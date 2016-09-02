require 'rails/generators/base'

module MyGem
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      argument :site_token

      def copy_initializer_file
        @site_token = site_token
        template("my_gem.rb.erb", File.join("config/initializers/my_gem.rb"))
      end
    end
  end
end
