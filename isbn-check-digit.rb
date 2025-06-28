# Checks if a given ISBN-10 is valid or not.
def valid_isbn_10(isbn)
  # Check allowed characters.
  return false unless isbn.match?(/^\d{9}(\d|X)$/)

  # Calculating checksum.
  check_sum = 0

  (0...isbn.length - 1).each do |index|
    check_sum += isbn[index].to_i * (10 - index)
  end
  check_digit = (11 - check_sum) % 11
  given_check_digit = isbn[-1] == 'X' ? 10 : isbn[-1].to_i
  # Comparing checkdigits.
  given_check_digit == check_digit
end

# Checks if a given ISBN-13 is valid or not.
def valid_isbn_13(isbn)
  # Check allowed characters.
  return false unless isbn.match?(/^\d{13}$/)

  # Calculating checksum.
  check_sum = 0

  (0...isbn.length - 1).each do |index|
    check_sum += isbn[index].to_i * (index.even? ? 1 : 3)
  end
  check_digit = (10 - check_sum) % 10
  given_check_digit = isbn[-1] == 'X' ? 10 : isbn[-1].to_i
  # Comparing checkdigits.
  given_check_digit == check_digit
end

# Checks if a given ISBN-10 or ISBN-13 is valid or not.
def valid_isbn(isbn)
  if isbn.length == 10 # Check if isbn is ISBN-10.
    valid_isbn_10(isbn)
  elsif isbn.length == 13 # Check if isbn is ISBN-13.
    valid_isbn_13(isbn)
  else
    false
  end
end

# Read inputs.
number_of_isbns = gets.to_i

# Store invalid ISBNs.
invalid_isbns = []

number_of_isbns.times do
  isbn = gets.chomp
  # Check if current ISBN is invalid.
  invalid_isbns << isbn unless valid_isbn(isbn)
end

# Output invalid ISBN's.
puts "#{invalid_isbns.length} invalid:"
puts invalid_isbns