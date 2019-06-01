module EachProgress
  private class Progress
    getter curr, total
    delegate start_at, to: @timer

    def initialize(@total : Int32, @disp_undone = " ", @disp_done = "#")
      @stream = STDERR.as(IO::FileDescriptor)
      @curr = 0
      @timer = Timer.new
      @total_digits = @total.to_s.size.as(Int32)
    end

    def tick
      return if done?
      @curr += 1
      print
    end

    def done? : Bool
      curr == total
    end

    def percent
      @curr.to_f / (@total.to_f / 100)
    end

    def remaining_time : Time::Span
      prcnt = percent
      remaining_prcnt = 100 - prcnt
      prcnts_per_second = @timer.elapsed_time.total_seconds.to_f / prcnt
      (remaining_prcnt * prcnts_per_second).ceil.seconds
    end

    def format_time_span(span : Time::Span)
      "#{span.minutes.to_s.rjust(2, '0')}:#{span.seconds.to_s.rjust(2, '0')}"
    end

    def print
      time = format_time_span(@timer.elapsed_time)
      r_time = format_time_span(remaining_time)
      prcnt = percent

      @stream.flush
      @stream.print "#{prcnt.to_i.to_s.rjust(3)}%|#{@disp_done * prcnt.to_i}#{@disp_undone * (100 - prcnt.to_i)}| #{curr.to_s.rjust(@total_digits)}/#{total} [#{time}<#{r_time}>]\r"
      @stream.print "\n" if done?
    end
  end
end
