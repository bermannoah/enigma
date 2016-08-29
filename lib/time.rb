class DateGenerator

  attr_reader :date_entry

  def initialize
    @time = Time.new
    @date_entry = nil
  end

  def time_finder
    time = Time.now
    @date_entry = time.strftime("%d%m%y")
  end

end
