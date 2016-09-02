require 'rails'
module MyGem
  class MyRailtie < Rails::Railtie
    initializer "my_initialization" do |app|
      puts 'initializing....................'
      ActionController::Base.send(:include, Injector::Filter)
    end

  class Injector

    module Filter
      extend ActiveSupport::Concern
      included do
        append_after_filter :add_script

        CLOSING_HEAD_TAG = %r{</head>}

        def add_script
          response.body = response.body.gsub(CLOSING_HEAD_TAG, "<script>!function(g,s,q,r,d){r=g[r]=g[r]||function(){(r.q=r.q||[]).push(
  arguments)};d=s.createElement(q);q=s.getElementsByTagName(q)[0];
  d.src='//d1l6p2sc9645hc.cloudfront.net/tracker.js';q.parentNode.
  insertBefore(d,q)}(window,document,'script','_gs');
  _gs('#{MyGem.configure.site_token}'); _gs('set', 'trackLocal', true); </script>" + "\n </head>")
        end

      end
    end

  end

  end
end
