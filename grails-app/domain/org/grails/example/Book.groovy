package org.grails.example
class Book {

    static hasMany = [bookmarks: Bookmark, authors: Author]

    Author coAuthor
    String title
    BookType bookType
    Date releaseDate
    Boolean inStock
    BigDecimal price
    BigDecimal pricePlusTax
    Currency currency = Currency.getInstance("USD")
    Date lastUpdated
    String readPriority = 'Low'
    BigDecimal cost = 0.00
    Boolean isScary

    void setCurrency(String currency) {
        this.currency = Currency.getInstance(currency)
    }

    void setCurrency(Currency currency) {
        this.currency = currency
    }

    static constraints = {
        title(blank: true, nullable: true)
        coAuthor(nullable: true)
        bookType(nullable: true)
        releaseDate(nullable: true)
        price(nullable: true)
        pricePlusTax(nullable: true)
        currency(nullable: true)
        inStock(nullable: true)
        lastUpdated(nullable: true)
        readPriority(inList: ['Low', 'Normal', 'High'])
        cost(min: 0.00)
        authors nullable: true
        bookmarks nullable: true
        isScary nullable: true
    }

    static mapping = {
        sort "title"
        authors lazy: false
        pricePlusTax formula: 'price * 1.055'
        tablePerSubclass true
        tablePerHierarchy true
    }

    String toString() {
        return title
    }

    Boolean getIsMagazine(){
        this instanceof Magazine
    }
}
