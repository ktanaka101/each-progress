module EachProgress
  private class Timer
    getter start_at : Time

    def initialize
      @start_at = Time.utc
    end

    def elapsed_time : Time::Span
      Time.utc - @start_at
    end
  end
end
