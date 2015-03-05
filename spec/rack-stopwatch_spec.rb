require File.dirname(__FILE__) + '/spec_helper'

describe Rack::Stopwatch do
  app = lambda { |env|
    [200, {'Content-Type' => 'text/plain'}, ["Hello, World!"]]
  }

  context 'confirm to Rack::Lint' do
    subject do
      Rack::Lint.new(app)
    end
    it do
      response = Rack::MockRequest.new(subject).get('/')
      expect(response.body).to eq 'Hello, World!'
    end
  end

  before do
    Timecop.freeze Time.now
  end

  after do
    Timecop.return
  end


end

