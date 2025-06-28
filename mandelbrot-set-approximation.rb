# This program reads an integer input and generates a 2D representation of a fractal pattern. 
number_of_y = gets.strip.to_i
number_of_x = 3 * (number_of_y - 1) / 2 + 1

delta_y = 2.0 / (number_of_y - 1).to_f
delta_x = 3.0 / (number_of_x - 1).to_f

y_values = (0...number_of_y).map { |i| 1.0 - (i * delta_y) }
x_values = (0...number_of_x).map { |i| -2.0 + (i * delta_x) }

fractal_character = lambda do |real_part, imaginary_part|
    z_real = 0.0
    z_imaginary = 0.0

    10.times do
    z_real_new = z_real * z_real - z_imaginary * z_imaginary + real_part
    z_imaginary_new = 2.0 * z_real * z_imaginary + imaginary_part
    z_real = z_real_new
    z_imaginary = z_imaginary_new
    end

    (Math.sqrt(z_real * z_real + z_imaginary * z_imaginary) <= 1.0) ? '*' : ' '
end

y_values.each do |y_value|
    line = x_values.map { |x_value| fractal_character.call(x_value, y_value) }.join
    puts line
end