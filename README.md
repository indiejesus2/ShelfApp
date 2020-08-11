# ShelfApp

## Summary

Shelf, a basic Sinatra application that allows users to keep track of their books, as well as progress in reading a book. 

A user can signup with a username and email, both of which must be unique, and a password to allow them access to their personal shelf. Once a user signs up, they can begin adding books to their shelf. 

The user must include a title and author for the book to be saved into the database, otherwise an error will be displayed and the book won't be inserted. Genres are optional.

Once the book has been saved to a user's shelf, the book will display pages read that will be defaulted at 0, a blank checkbox for completed. A user can update the pages read or completion directly from their Shelf (index). If a user updates the number of pages read in a book, or the book has been completed, a message will be displayed at the top notifying the user that changes have been saved. If a book is completed, the pages read input will not be displayed for that particular book. A user can also delete a book directly from the index page as well.

If there isn't a user logged in and they attempt to access the books or books/new pages, they will be redirected to the failure page that explains they need to be logged in to access that information.

## Install

In order to run application successfully, please run bundle install for the necessary gems to be installed.

The Session_Secret is hidden to prevent users and others from viewing password. In order for the application to run correctly, it is advised to create a .env file that stores Session_Secret.

Once the gems have been properly installed, the application can be run by typing shotgun into terminal. This will set up a local host that will allow users to interact with the app. Enjoy!

## Contributing

Pull requests are encouraged on [GitHub](https://github.com/indiejesus2/ShelfApp) as well as any bug reports. This project is intended to be a safe, welcoming space for colloration, and contributors are expected to adhere to the Contributor Covenant Code of Conduct.

## License

This gem is an open source under the terms of the [MIT License](https://github.com/indiejesus2/ShelfApp/blob/master/LICENSE).