package org.grails.example.nested

import groovy.transform.ToString

class Part {

    String name = 'part'

    static hasMany = [functions: Function]
    static belongsTo = [Robot]

    static constraints = {
        functions nullable: true
    }

    @Override
    public String toString() {
        name
    }
}
