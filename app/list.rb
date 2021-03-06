class List
  DEFAULT_FILE_LOCATION = $FILE_LOCATION

  attr_reader :data

  def initialize(filename)
    @filename = filename || DEFAULT_FILE_LOCATION
    @data = []
    read_file
  end

  def self.write(data, filename = DEFAULT_FILE_LOCATION)
    File.open(filename, 'a') do |f|
      f.puts(data)
      data
    end
  end

  private

  def read_file
    File.open(@filename, 'r') { |file| format_data(file) }
  end

  def format_data(file)
    file.each_line { |line| @data << format_line(line) }
  end

  def format_line(line)
    ary = line.rstrip.split(/,\s?/)
    { last: ary[0], first: ary[1], gender: ary[2], color: ary[3], birthdate: ary[4] }
  end
end
