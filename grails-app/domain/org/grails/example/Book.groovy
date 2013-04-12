package org.grails.example
class Book {
	static hasMany = [ bookmarks : Bookmark ]
	
    Author author
    Author coAuthor
    String title
    BookType bookType
    Date releaseDate
    Boolean inStock
    BigDecimal price
	BigDecimal pricePlusTax
	Currency currency = Currency.getInstance("USD")
    Date lastUpdated
    String readPriority
    BigDecimal cost
	
    static constraints = {
        title(blank:false)
        author()
        coAuthor(nullable:true)
        bookType(nullable:true)
        releaseDate()
        price()
		pricePlusTax()
		currency()
        inStock()
        lastUpdated(nullable:true)
        readPriority(inList:['Low','Normal','High'])
        cost(min:0.00)
    }
	
    static mapping = {
        author lazy:false
		pricePlusTax formula: 'price * 1.055'
		sort "title"
    }
	
    String toString() {
        return title
    }
}
