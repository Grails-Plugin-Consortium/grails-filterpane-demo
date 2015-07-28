package org.grails.example


class Publisher {

	static hasMany = [ authors : Author ]
	
	String firstName
	String lastName
	
    static constraints = {
		firstName()
		lastName()
    }

    static mapping = {
        autoImport false
    }
}
