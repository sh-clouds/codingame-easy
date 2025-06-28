# Read number of titles
number_of_titles = gets.to_i
titles = []
number_of_titles.times do
  titles << gets.chomp.strip
end

titles_hash = titles.uniq.each_with_index.to_h
max_rank = 0
freed_books_count = 0
books_to_be_read = []

# Read number of entries
number_of_entries = gets.to_i
books = {}

number_of_entries.times do
  entry = gets.chomp.strip.match(/(.*) ([0-9]+|None)/)
  
  # It's a book we haven't read yet, we can't remove it
  if entry[2] == 'None'
    titles_hash.delete(entry[1]) # We don't want duplicates
    books_to_be_read << entry[1]
  else
    rank = entry[2].to_i
    max_rank = rank if rank > max_rank # Get the highest ranking

    unless titles_hash.key?(entry[1])
      books[rank] ||= []
      books[rank] << entry[1]
    else
      freed_books_count += 1 # It's a duplicate, remove the one we currently have
    end
  end
end

books = books.sort.to_h

places_needed = titles_hash.size # How many books we need to remove from the bookshelf

books.each do |rank, list|
  break if rank == max_rank

  books.delete(rank) # Remove all the books with this ranking

  freed_books_count += list.size
  break if freed_books_count >= places_needed # We have removed enough books
end

if freed_books_count >= places_needed
  bookshelf = titles_hash.keys + books_to_be_read

  books.each_value do |list|
    bookshelf.concat(list)
  end

  bookshelf.sort! # Books composing her bookshelf ordered by alphabetical
  puts bookshelf.join("\n")
else
  puts "Your TBR is out of control Clara!"
end