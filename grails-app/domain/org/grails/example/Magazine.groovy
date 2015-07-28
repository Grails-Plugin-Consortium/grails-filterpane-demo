package org.grails.example

class Magazine extends Book {
	
	Date displayUntil = new Date()+2
	int month = new Date().month
	int year = new Date().year+1900


    static mapping = {
        autoImport false
    }
}