package org.grails.example

import org.joda.time.*
import org.jadira.usertype.dateandtime.joda.*

class Calendar {

    DateTime dateTime = new DateTime() //Filtering this will not work due to multi column
    LocalDate localDate = new LocalDate()
    Date date = new Date()
    String name

    static constraints = {
        dateTime nullable: true
        date nullable: true
        localDate nullable: true
        name nullable: false
    }

    static mapping = {
        dateTime type: PersistentDateTimeWithZone, {
            column name: "dateTime_timestamp"
            column name: "dateTime_zone"
        }
    }
}
