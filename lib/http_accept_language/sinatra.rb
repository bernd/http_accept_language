require 'http_accept_language'

# This is a sinatra extension to enable the usage of
# the HttpAcceptLanguage helpers.
#
# In a classic style app just require 'http_accept_language/sinatra'
# and use the helper methods like "request.compatible_language_from()".
#
# In a modular style app do the following.
#
#   require 'sinatra/base'
#   require 'http_accept_language/sinatra'
#
#   class MyApp < Sinatra::Base
#     register Sinatra::HttpAcceptLanguage
#
#     get '/' do
#       @lang = request.compatible_language_from(['en', 'de'])
#       ...
#     end
#   end
module Sinatra
  module HttpAcceptLanguage
    def self.registered(app)
      ::Sinatra::Request.send(:include, ::HttpAcceptLanguage)
    end
  end

  register Sinatra::HttpAcceptLanguage
end
