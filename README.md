Sinatra::JSONP
=================

JSONP output for [Sinatra](http://sinatrarb.com). Automatically detects callback params
and returns proper JSONP output. If no callback params where detected returns plain JSON.
Works with [jQuery](http://jquery.com) [jQuery.getJSON](http://api.jquery.com/jQuery.getJSON/) function out of the box.

Installation
------------

    gem install sinatra-jsonp

Usage
-----

Simple example:

    require "sinatra"
    require "sinatra/jsonp"


    get '/users/:user' do
      user = User[params[:user]]
      JSONP user
    end

    # or define your own callback as second param

    get '/' do
      data = ["hello","hi","hallo"]
      jsonp data, 'functionA'
    end

License
-------

sinatra-jsonp is licensed under the MIT license.


