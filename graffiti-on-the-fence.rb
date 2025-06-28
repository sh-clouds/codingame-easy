require 'json'

=begin
    st      ed
    !░░░░░░░░!
          !░░░░░░░░!
                         !░░░░░░░░!
 +--+--+--+--+--+--+--+--+--+--+--+--+
 0  1  2  3  4  5  6  7  8  9  10 11 12

 output :
 0 1
 6 8
 11 12
=end

class Section
  attr_reader :start, :end, :painted

  def initialize(start_point, end_point, painted = true)
    @start = start_point
    @end = end_point
    @painted = painted
  end
end

class Fence
  def initialize(length, number_of_reports)
    @length = length
    @number_of_reports = number_of_reports
    @paintings = []
    @unpainted_sections = []
  end

  def add_paint(start_point, end_point)
    painting = Section.new(start_point, end_point)
    @paintings << painting
  end

  def sort_sections(sections)
    sections.sort_by!(&:start)
  end

  def print_sections_to_std_err(sections)
    sections.each { |section| STDERR.puts "#{section.start} #{section.end}" }
  end

  def print_sections(sections)
    STDERR.puts "_" * 20
    if sections.empty?
      print "All painted"
    else
      sections.each_with_index do |section, index|
        print "#{section.start} #{section.end}"
        print "\n" unless index == sections.length - 1
      end
    end
  end

  def find_next_unpainted(it, index)
    if index >= @paintings.length
      @unpainted_sections << Section.new(it, @length, false) if it < @length
      return
    end
    start_point = it
    end_point = @paintings[index].start
    STDERR.puts "next #{it} #{index} #{start_point} #{end_point}"
    @unpainted_sections << Section.new(start_point, end_point, false) if start_point < end_point
    it = [it, @paintings[index].end].max
    find_next_unpainted(it, index + 1)
  end

  def output_unpainted
    sort_sections(@paintings)
    print_sections_to_std_err(@paintings)
    find_next_unpainted(0, 0)
    print_sections(@unpainted_sections)
    print "\n"
  end
end

length = gets.to_i
number_of_reports = gets.to_i
fence = Fence.new(length, number_of_reports)
STDERR.puts "length = #{length}   number_of_reports = #{number_of_reports}"

number_of_reports.times do
  start_point, end_point = gets.split.map(&:to_i)
  fence.add_paint(start_point, end_point)
end

fence.output_unpainted
