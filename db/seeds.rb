User.create!(name: "hoang",
    age: "1998-01-01",
    gender: "Male",
    email: "hoang@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    type: 0)

10.times do |n|
    name = "hoang-#{n+1}"
    age = "1998-01-01"
    gender = "Male"
    email = "hoang#{n+1}@gmail.com"
    password = "123456"
    User.create!(name: name,
    gender: gender,
    age: "1998-01-01",
    email: email,
    password: password,
    password_confirmation: password,
    type: 1)
end

BookType.create!(name: "comic")
BookType.create!(name: "education")
BookType.create!(name: "novel")

99.times do |n|
    name = "Sách-#{n+1}"
    author = "Author-#{n+1}"
    publisher = "NXB-#{n%3+1}"
    book_type_id = n%3 +1
    price = n+3
    status = 0
    Book.create!(name: name,
    author: author,
    publisher: publisher,
    book_type_id: book_type_id,
    price: price,
    status: status)
end

# 10.times do |n|
#     client_id = n%3 +2
#     employee_id = 1
#     status = n%2
#     return_date = Date.today
#     BookCard.create!(client_id: client_id,
#     employee_id: employee_id,
#     return_date: return_date,
#     status: status)
# end

# 90.times do |n|
#     book_card_id = n%3+1
#     book_id = n+1
#     BorrowedBook.create!(
#     book_id: book_id,
#     book_card_id: book_card_id)
# end


