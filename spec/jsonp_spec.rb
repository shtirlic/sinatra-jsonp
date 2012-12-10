require 'backports'
require 'spec_helper'

describe Sinatra::Jsonp do
  before do
    mock_app do
      helpers Sinatra::Jsonp

      get '/method' do
        data = ["hello","hi","hallo"]
        jsonp data
      end
      get '/method_with_params' do
        data = ["hello","hi","hallo"]
        jsonp data, :functionA
      end
    end
  end

  it "returns JSON if no callback passed" do
    get '/method'
    body.should == '["hello","hi","hallo"]'
  end
  it "returns JSONP if callback passed via request params" do
    get '/method?callback=functionA'
    body.should == 'functionA(["hello","hi","hallo"])'
  end

  it "returns JSONP with sanitized callback" do
    get '/method', { :callback=>'foo<script>alert(1)</script>' }
    body.should == 'fooscriptalert1script(["hello","hi","hallo"])'
  end

  it "returns JSONP if callback passed via method param" do
    get '/method_with_params'
    body.should == 'functionA(["hello","hi","hallo"])'
  end
  it "returns JSONP with callback passed via method params even if it passed via request param" do
    get '/method_with_params?callback=functionB'
    body.should == 'functionA(["hello","hi","hallo"])'
  end

  it "return pretty JSON if :json_pretty enabled" do
    mock_app do
      helpers Sinatra::Jsonp
      enable :json_pretty
      get '/method' do
        data = ["hello","hi","hallo"]
        jsonp data
      end
    end
    get '/method'
    body.should == "[\n  \"hello\",\n  \"hi\",\n  \"hallo\"\n]"
  end
end
