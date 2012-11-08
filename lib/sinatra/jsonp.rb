require 'sinatra/base'
require 'multi_json'

module Sinatra
  module Jsonp
    def jsonp(*args)
      if args.size > 0
        data = MultiJson.dump args[0]
        if args.size > 1
          callback = args[1].to_s
        else
          ['callback','jscallback','jsonp','jsoncallback'].each do |x|
            callback = params.delete(x) unless callback
          end
        end
        if callback
          content_type :js
          response = "#{callback}(#{data})"
        else
          response = data
        end
        response
      end
    end
    alias JSONP jsonp
  end
  helpers Jsonp
end
