package org.grails.example.nested

import groovy.transform.ToString

class Function {

    String name = 'function'

    static belongsTo = [Part]

    static constraints = {
    }

    static mapping = {
        autoImport false
    }

    @Override
    public String toString() {
        name
    }
}
