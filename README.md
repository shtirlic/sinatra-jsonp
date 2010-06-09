Sinatra::JSONP
=================

JSONP output helper for [Sinatra](http://sinatrarb.com). Automatically detects callback params and returns proper JSONP output. 
If no callback params where detected it returns plain JSON.
Works with [jQuery](http://jquery.com) [jQuery.getJSON](http://api.jquery.com/jQuery.getJSON/) method out of the box.


Installation
------------
<pre>
sudo gem install sinatra-jsonp
</pre>

Usage
-----
<pre>
require "sinatra"
require "sinatra/jsonp"

get '/hello' do
  data = ["hello","hi","hallo"]
  JSONP data      # JSONP is an alias for jsonp method
end

# define your own callback as second string param
get '/hi' do
  data = ["hello","hi","hallo"]
  jsonp data, 'functionA'
end

# same with symbol param
get '/hallo' do
  data = ["hello","hi","hallo"]
  jsonp data, :functionB
end
</pre>

Links
-----

* [jQuery](http://jquery.com)
* [Sinatra](http://www.sinatrarb.com)


License
-------

sinatra-jsonp is licensed under the MIT license.
