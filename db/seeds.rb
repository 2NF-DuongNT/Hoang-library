99.times do |n|
    name = "Sách-#{n+1}"
    author = "Abcccc"
    publisher = "NXB"
    book_type_id = n%3 +1
    price = n+3
    status = n%3
    Book.create!(name: name,
    author: author,
    publisher: publisher,
    book_type_id: book_type_id,
    price: price,
    status: status)
end

