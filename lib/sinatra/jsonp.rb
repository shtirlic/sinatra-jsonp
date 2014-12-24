require 'sinatra/base'
require 'multi_json'

module Sinatra
  module Jsonp
    def jsonp(*args)
      # requires 1 or more arguments
      return if args.size < 1

      # The first argument is the object to serialize
      data = MultiJson.dump(args[0], :pretty => display_pretty_json?)
      # If we have another argument it is the callback function name
      if args.size > 1
        callback = args[1].to_s
      else
        # If not then determine the callback based on the following parameters
        ['callback','jscallback','jsonp','jsoncallback'].each do |x|
          callback = params.delete(x) unless callback
        end
      end
      # If we have a callback perform some basic sanitization and set the
      # response content type and the eventual response body
      if callback
        callback.tr!('^a-zA-Z0-9_$\.', '')
        content_type :js
        response = "#{callback}(#{data})"
      else
        # If no callback then set the response content type to json and return
        # the serialized data
        content_type :json
        response = data
      end
      response
    end
    alias JSONP jsonp

    private

    def display_pretty_json?
      !!(settings.respond_to?(:json_pretty) && settings.json_pretty)
    end
  end
  helpers Jsonp
end
