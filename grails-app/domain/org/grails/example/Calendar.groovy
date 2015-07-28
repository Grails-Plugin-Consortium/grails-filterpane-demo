package org.grails.example

import org.joda.time.*

class Calendar {

    LocalDate localDate = new LocalDate()
    Date date = new Date()
    String name

    static constraints = {
        date nullable: true
        localDate nullable: true
        name nullable: false
    }

    static mapping = {
        autoImport false
    }
}
