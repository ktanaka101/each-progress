module EachProgress
  private class Timer
    getter start_at : Time

    def initialize
      @start_at = Time.utc_now
    end

    def elapsed_time : Time::Span
      Time.utc_now - @start_at
    end
  end
end
