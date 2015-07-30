package org.grails.example

import org.grails.plugin.filterpane.FilterPaneUtils

class MagazineController {

    def filterPaneService

    // the delete, save and update actions only accept POST requests
    def static allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def index = {
        redirect(action: 'list', params: params)
    }

    def list = {
        if (!params.max) params.max = 10
        log.debug("Magazine is ${Magazine} or type ${Magazine.class}")
        [magazineList: Magazine.list(params), filterParams: FilterPaneUtils.extractFilterParams(params)]
    }

    def filter = {
        if (!params.max) params.max = 10
        render(view: 'list', model: [magazineList: filterPaneService.filter(params, Magazine), magazineCount: filterPaneService.count(params, Magazine), filterParams: FilterPaneUtils.extractFilterParams(params), params: params])
    }

    def show = {
        def magazine = Magazine.get(params.id)

        if (!magazine) {
            flash.message = "Magazine not found with id ${params.id}"
            redirect(action: list)
        } else {
            return [magazine: magazine]
        }
    }

    def delete = {
        def magazine = Magazine.get(params.id)
        if (magazine) {
            magazine.delete()
            flash.message = "Magazine ${params.id} deleted"
            redirect(action: list)
        } else {
            flash.message = "Magazine not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def magazine = Magazine.get(params.id)

        if (!magazine) {
            flash.message = "Magazine not found with id ${params.id}"
            redirect(action: list)
        } else {
            return [magazine: magazine]
        }
    }

    def update = {
        def magazine = Magazine.get(params.id)
        if (magazine) {
            magazine.properties = params
            if (!magazine.hasErrors() && magazine.save()) {
                flash.message = "Magazine ${params.id} updated"
                redirect(action: show, id: magazine.id)
            } else {
                render(view: 'edit', model: [magazine: magazine])
            }
        } else {
            flash.message = "Magazine not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        def magazine = new Magazine()
        magazine.properties = params
        ['magazine': magazine]
    }

    def save = {
        def magazine = new Magazine(params)
        if (!magazine.hasErrors() && magazine.save()) {
            flash.message = "Magazine ${magazine.id} created"
            redirect(action: show, id: magazine.id)
        } else {
            flash.message = magazine.errors.toString()
            render(view: 'create', model: [magazine: magazine])
        }
    }
}