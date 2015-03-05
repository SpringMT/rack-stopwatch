module Rack
  class Stopwatch
    def initialize()
      @starttime = Time.now
      @logs = []
    end
    def lap
      Time.now - @starttime
    end
  end

  class Request
    def initialize(app, options = {})
      @stopwatch = Stopwatch.new
      super
    end
    def lap
      @stopwatch.lap
    end
  end
end
