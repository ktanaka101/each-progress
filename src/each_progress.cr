require "./each_progress/*"

module EachProgress
  def self.by(itr)
    prgs = Progress.new(itr.size)
    prgs.print

    itr.each do |*x|
      yield *x
      prgs.tick
    end
  end
end
