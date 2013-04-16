import org.grails.example.nested.Function
import org.grails.example.nested.Part
import org.grails.example.nested.Robot

import java.sql.Date

import org.grails.example.*

class BootStrap {

    def init = { servletContext ->
        bootstrapTestData()
    }
    def destroy = {
    }


    private bootstrapTestData() {
        Publisher p = new Publisher(firstName: 'Some', lastName: 'Publisher').save()
        Publisher p2 = new Publisher(firstName: 'Some', lastName: 'Other Publisher').save()

        Author da = new Author(firstName: 'Douglas', lastName: 'Adams', age: 42, favoriteGenre: FavoriteGenre.SciFi, birthdate: Date.valueOf('1952-03-11'), publisher: p).save()
        Author cl = new Author(firstName: 'Clive', lastName: 'Lewis', favoriteGenre: FavoriteGenre.Fantasy, birthdate: Date.valueOf('1898-11-29'), publisher: p2).save()
        Author ra = new Author(firstName: 'Richard', lastName: 'Adams', favoriteGenre: FavoriteGenre.Fiction, birthdate: Date.valueOf('1920-05-10'), publisher: p).save()
        Author mt = new Author(firstName: 'Mark', lastName: 'Twain', favoriteGenre: FavoriteGenre.Satire, birthdate: Date.valueOf('1835-11-30'), publisher: p2).save()
        Author sk = new Author(firstName: 'Steve', lastName: 'Krug', favoriteGenre: FavoriteGenre.Reference, birthdate: Date.valueOf('1950-01-01'), publisher: p).save()
        Author sf = new Author(firstName: 'Scott', lastName: 'Fox', favoriteGenre: FavoriteGenre.Reference, birthdate: Date.valueOf('1969-01-01'), publisher: p).save()
        Author mg = new Author(firstName: 'Malcolm', lastName: 'Gladwell', favoriteGenre: FavoriteGenre.Reference, publisher: p2).save()
        Author hm = new Author(firstName: 'Herman', lastName: 'Melville', favoriteGenre: FavoriteGenre.Fiction, publisher: p).save()
        Author ac = new Author(firstName: 'Arthur', lastName: 'Clarke', favoriteGenre: FavoriteGenre.SciFi, publisher: p).save()

        Author dm = new Author(firstName: 'Dave', lastName: 'Mark', favoriteGenre: FavoriteGenre.Reference, publisher: p).save()
        Author jl = new Author(firstName: 'Jeff', lastName: 'LaMarche', favoriteGenre: FavoriteGenre.Reference, publisher: p).save()

        Book vdt = new Book(authors: [cl], title: "The Voyage of the Dawn Treader", releaseDate: java.sql.Date.valueOf('1952-01-01'), inStock: false, price: 25.00, cost: 20.00, readPriority: 'High', bookType: BookType.Fiction).save()
        new Book(authors: [ra], title: "Watership Down", releaseDate: java.sql.Date.valueOf('1972-01-01'), inStock: true, price: 7.99, cost: 3.27, readPriority: 'Normal', bookType: BookType.Fiction).save()
        new Book(authors: [mt], title: "The Adventures of Tom Sawyer", releaseDate: java.sql.Date.valueOf('1876-01-01'), inStock: true, price: 9.99, cost: 4.34, readPriority: 'Low', bookType: BookType.Fiction).save()
        new Book(authors: [mt], title: "The Prince and the Pauper", releaseDate: java.sql.Date.valueOf('1882-01-01'), inStock: false, price: 9.99, cost: 3.54, readPriority: 'Low', bookType: BookType.NonFiction).save()
        Book uhg = new Book(authors: [da], title: "The Ultimate Hitchhiker's Guide", releaseDate: java.sql.Date.valueOf('2005-01-01'), inStock: true, price: 19.99, cost: 8.98, readPriority: 'Normal', bookType: BookType.Fiction).save()
        new Book(authors: [sk], title: "Don't Make Me Think", releaseDate: java.sql.Date.valueOf('2006-01-01'), inStock: true, price: 35.99, cost: 16.99, readPriority: 'Normal', bookType: BookType.Reference).save()
        new Book(authors: [sf], title: "Internet Riches", releaseDate: java.sql.Date.valueOf('2005-01-01'), inStock: true, price: 19.99, cost: 12.99, readPriority: 'Low', bookType: BookType.NonFiction).save()
        new Book(authors: [mg], title: "Blink: The Power of Thinking Without Thinking", releaseDate: java.sql.Date.valueOf('2007-04-03'), inStock: true, price: 10.87, cost: 1.99, readPriority: 'Normal', bookType: BookType.NonFiction).save()
        new Book(authors: [cl], title: "The Last Battle", releaseDate: java.sql.Date.valueOf('1952-01-01'), inStock: true, price: 25.00, cost: 17.44, readPriority: 'High', bookType: BookType.Fiction).save()
        new Book(authors: [cl], title: "Prince Caspian", releaseDate: java.sql.Date.valueOf('1952-01-01'), inStock: false, price: 16.99, cost: 9.99, readPriority: 'Normal', bookType: BookType.Fiction).save()
        new Book(authors: [hm], title: "Moby Dick", releaseDate: java.sql.Date.valueOf('1851-01-01'), inStock: true, price: 9.99, cost: 5.25, readPriority: 'High', bookType: BookType.Fiction).save()
        new Book(authors: [ac], title: "The Collected Stories of Arthur C. Clarke", releaseDate: java.sql.Date.valueOf('2002-01-14'), inStock: true, price: 13.99, cost: 9.99, readPriority: 'Normal', bookType: BookType.Fiction).save()
        new Book(authors: [dm], coAuthor: jl, title: 'Beginning iPhone Development', releaseDate: java.sql.Date.valueOf('2008-11-01'), inStock: true, price: 39.99, cost: 27.99, readPriority: 'Normal', bookType: BookType.Reference).save()
        new Book(authors: [dm], coAuthor: jl, title: 'Hello-how are you', releaseDate: java.sql.Date.valueOf('2008-11-01'), inStock: true, price: 39.99, cost: 27.99, readPriority: 'Normal', bookType: BookType.Reference).save()

        new Bookmark(book: vdt, page: 42, dateCreated: java.sql.Date.valueOf('2011-02-17')).save()
        new Bookmark(book: uhg, page: 247, dateCreated: java.sql.Date.valueOf('2010-11-05')).save()


        Robot.findOrSaveWhere(name: 'wally')
                .addToParts(Part.findOrSaveWhere(name: 'eyes')
                                    .addToFunctions(Function.findOrSaveWhere(name: 'vision'))
                                    .addToFunctions(Function.findOrSaveWhere(name: 'motion'))
                                    .addToFunctions(Function.findOrSaveWhere(name: 'sight')))
                .addToParts(Part.findOrSaveWhere(name: 'treads')
                                    .addToFunctions(Function.findOrSaveWhere(name: 'motion'))
                                    .addToFunctions(Function.findOrSaveWhere(name: 'flight')))
        Robot.findOrSaveWhere(name: 'jonny5')
                .addToParts(Part.findOrSaveWhere(name: 'eye')
                                    .addToFunctions(Function.findOrSaveWhere(name: 'vising'))
                                    .addToFunctions(Function.findOrSaveWhere(name: 'motion'))
                                    .addToFunctions(Function.findOrSaveWhere(name: 'seeing')))
                .addToParts(Part.findOrSaveWhere(name: 'tread')
                                    .addToFunctions(Function.findOrSaveWhere(name: 'motion'))
                                    .addToFunctions(Function.findOrSaveWhere(name: 'flying')))
        Robot.findOrSaveWhere(name: 'supreme commander')
                .addToParts(Part.findOrSaveWhere(name: 'laser')
                                    .addToFunctions(Function.findOrSaveWhere(name: 'zapping')))
    }
}
