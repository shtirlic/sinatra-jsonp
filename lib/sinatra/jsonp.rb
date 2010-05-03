require 'sinatra/base'
require 'json'

module Sinatra
  module Jsonp
    # Format data according to request JSON/JSONP
    def JSONP(obj, callback = nil) 
      data = obj.to_json
      ['callback','jscallback','jsonp'].each do |x| 
        callback = params.delete(x) if not callback
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
  helpers Jsonp
end
