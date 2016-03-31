class List
  DEFAULT_FILE_LOCATION = './app/records.txt'
  attr_reader :data

  def initialize(location = DEFAULT_FILE_LOCATION)
    @location = location
    @data = []
    read_file
  end

  def self.write(data, location = DEFAULT_FILE_LOCATION)
    File.open(location,'a') do |f|
      f.puts(data)
      data
    end
  end

  private

  def read_file
    File.open(@location,'r') do |file|
      format_data(file)
    end
  end

  def format_data(file)  
    file.each_line { |line| @data << format_line(line) }
  end

  def format_line(line)
    ary = line.rstrip.split(/,\s?/)
    { last: ary[0], first: ary[1], gender: ary[2], color: ary[3], birthdate: ary[4] }
  end
end