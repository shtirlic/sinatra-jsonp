require 'sinatra/base'
require 'multi_json'

module Sinatra
  module Jsonp
    CALLBACK_PARAMS = %w( callback jscallback jsonp jsoncallback ).freeze

    def jsonp(*args)
      return if args.size < 1
      data = MultiJson.dump(args[0], :pretty => display_pretty_json?)
      callback = extract_callback_name(args[1])
      type, response = determine_response(data, callback)
      content_type(type)
      response
    end
    alias JSONP jsonp

    private

    def determine_response(data, callback = nil)
      return [:json, data] if callback.nil?
      callback.tr!('^a-zA-Z0-9_$\.', '')
      [:js, format("%s(%s)", callback, data)]
    end

    def display_pretty_json?
      !!(settings.respond_to?(:json_pretty) && settings.json_pretty)
    end

    def extract_callback_name(name = nil)
      if name.nil?
        callback = nil
        CALLBACK_PARAMS.each do |key|
          callback = params.delete(key) unless callback
        end
        callback ? callback.to_s : nil
      else
        name.to_s
      end
    end
  end
  helpers Jsonp
end
