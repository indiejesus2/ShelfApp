library_girl = User.create(username: "Librarygirl93", email: "lbrygrl93@test.com", password: "abc123")
dste = User.create(username: "Dste", email: "dste@aol.com", password: "test123")

little_women = Book.create(title: "Little Women", author: "Louisa May Alcott", genre: "coming of age")
pride_and_prejudice = Book.create(title: "Pride and Prejudice", author: "Jane Austen", genre: "classic romance")
on_the_road = Book.create(title: "On the Road", author: "Jack Kerouac", genre: "beat")

library_girl.books << little_women
library_girl.books << pride_and_prejudice
dste.books << on_the_road