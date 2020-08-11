# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - The application was built using Sinatra exclusively.
- [x] Use ActiveRecord for storing information in a database - Tables were created using ActiveRecord as well as inserting data.
- [x] Include more than one model class (e.g. User, Post, Category) - There are three models, including User, Books, and UserBooks.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User has_many books, and books has_many users as well.
- [X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Books belong to users.
- [x] Include user accounts with unique login attribute (username or email) - Validations were set so similar usernames/emails cannot make multiple accounts.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Users can create a new book, which is can viewed or read on their index page. The index page also allows for updating and destroying books.
- [x] Ensure that users can't modify content created by other users - If a user is not logged in, they will be rerouted to the failure when trying to access index or new page.
- [x] Include user input validations - Users must have a title and author to save a new book to their shelf.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - Various messages, including incorrect username/password or not having necessary information to save book.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits - While at first building the project, I forgot to make small Git commits, but I strived to make multiple Git commits later in the process.
- [x] Your commit messages are meaningful - I believe that messages either plainly described changes, and at times with more detail than necessary.
- [x] You made the changes in a commit that relate to the commit message - All commit messages should directly relate to git commits.
- [x] You don't include changes in a commit that aren't related to the commit message - A majority of commits were described in messages.