# Get width and height of input.
width, height = gets.chomp.split.map(&:to_i)

# Create output array
output_array = []

# Keep adding LSD onto output_array until its length is 8. Then convert and print.
height.times do
  gets.chomp.split.each do |value|
    pixel_value = value.to_i
    output_array << (pixel_value.to_s(2)[-1])
    # If output_array is 8 bits, convert to ASCII char and print. Also clear array.
    if output_array.length == 8
      print (output_array.join('').to_i(2)).chr
      output_array.clear
    end
  end
end