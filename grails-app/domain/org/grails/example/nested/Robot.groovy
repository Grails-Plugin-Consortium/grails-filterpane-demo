package org.grails.example.nested

class Robot {

    @Override
    public String toString() {
        name
    }

    String name = 'Bob'

    static hasMany = [parts: Part]

    static constraints = {
        parts nullable: true
        name nullable: true, blank: true
    }

    static mapping = {
        autoImport false
    }
}
