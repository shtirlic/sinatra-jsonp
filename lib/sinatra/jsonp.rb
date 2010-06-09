require 'sinatra/base'
require 'json'

module Sinatra
  module Jsonp
    def jsonp(*args) 
      if args.size > 0
        data = args[0].to_json
        if args.size > 1
          callback = args[1].to_s
        else
          ['callback','jscallback','jsonp'].each do |x| 
            callback = params.delete(x) if not callback
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
