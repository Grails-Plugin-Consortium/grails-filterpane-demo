package org.grails.example
class Author {
	String firstName = ''
	String lastName = ''
    FavoriteGenre favoriteGenre
	Publisher publisher
	int age = -1
    Date birthdate
	
	static hasMany = [ books: Book ]
	
	String toString() {
		return "${lastName}, ${firstName}"
	}
}
