package org.grails.example

class Author {
	String firstName = 'first'
	String lastName = 'last'
    FavoriteGenre favoriteGenre
	Publisher publisher
	Integer age = 30
    Date birthdate = new Date()
	
	static hasMany = [ books: Book ]
    static belongsTo = Book
	
	String toString() {
		return "${lastName}, ${firstName}"
	}

    static constraints = {
        firstName blank: false
        favoriteGenre nullable: true
        publisher nullable: true
        age nullable: true
        birthdate nullable: true
    }
}
