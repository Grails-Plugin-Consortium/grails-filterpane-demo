package org.grails.example

import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

class CalendarController {

    def filterPaneService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {

        if(!params.max) params.max = 10
        log.debug("Book is ${Book} or type ${Book.class}")
        [ calendarInstanceList: Calendar.list( params ), calendarInstanceTotal: Calendar.count(), filterParams: FilterPaneUtils.extractFilterParams(params) ]
    }

    def filter = {
        if(!params.max) params.max = 10
        render( view:'list', model:[ calendarInstanceList: filterPaneService.filter( params, Calendar ), calendarInstanceTotal: filterPaneService.count( params, Calendar ), filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
    }

    def create() {
        [calendarInstance: new Calendar(params)]
    }

    def save() {
        def calendarInstance = new Calendar(params)
        if(!calendarInstance.save(flush: true)) {
            render(view: "create", model: [calendarInstance: calendarInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'calendar.label', default: 'Calendar'), calendarInstance.id])
        redirect(action: "show", id: calendarInstance.id)
    }

    def show(Long id) {
        def calendarInstance = Calendar.get(id)
        if(!calendarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calendar.label', default: 'Calendar'), id])
            redirect(action: "list")
            return
        }

        [calendarInstance: calendarInstance]
    }

    def edit(Long id) {
        def calendarInstance = Calendar.get(id)
        if(!calendarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calendar.label', default: 'Calendar'), id])
            redirect(action: "list")
            return
        }

        [calendarInstance: calendarInstance]
    }

    def update(Long id, Long version) {
        def calendarInstance = Calendar.get(id)
        if(!calendarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calendar.label', default: 'Calendar'), id])
            redirect(action: "list")
            return
        }

        if(version != null) {
            if(calendarInstance.version > version) {
                calendarInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                                                    [message(code: 'calendar.label', default: 'Calendar')] as Object[],
                                                    "Another user has updated this Calendar while you were editing")
                render(view: "edit", model: [calendarInstance: calendarInstance])
                return
            }
        }

        calendarInstance.properties = params

        if(!calendarInstance.save(flush: true)) {
            render(view: "edit", model: [calendarInstance: calendarInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'calendar.label', default: 'Calendar'), calendarInstance.id])
        redirect(action: "show", id: calendarInstance.id)
    }

    def delete(Long id) {
        def calendarInstance = Calendar.get(id)
        if(!calendarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calendar.label', default: 'Calendar'), id])
            redirect(action: "list")
            return
        }

        try {
            calendarInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'calendar.label', default: 'Calendar'), id])
            redirect(action: "list")
        }
        catch(DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'calendar.label', default: 'Calendar'), id])
            redirect(action: "show", id: id)
        }
    }
}
