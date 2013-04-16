package org.grails.example.nested

import org.springframework.dao.DataIntegrityViolationException
import org.grails.plugin.filterpane.FilterPaneUtils

class RobotController {

    def filterPaneService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def filter = {
        if(!params.max) params.max = 10
        render( view:'list', model:[ robotList: filterPaneService.filter( params, Robot ), robotCount: filterPaneService.count( params, Robot ), filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
    }

    def list(Integer max) {
        if(!params.max) params.max = 10
        log.debug("Robot is ${Robot} or type ${Robot.class}")
        [ robotList: Robot.list( params ), filterParams: FilterPaneUtils.extractFilterParams(params) ]
    }

    def create() {
        [robotInstance: new Robot(params)]
    }

    def save() {
        def robotInstance = new Robot(params)
        if (!robotInstance.save(flush: true)) {
            render(view: "create", model: [robotInstance: robotInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'robot.label', default: 'Robot'), robotInstance.id])
        redirect(action: "show", id: robotInstance.id)
    }

    def show(Long id) {
        def robotInstance = Robot.get(id)
        if (!robotInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'robot.label', default: 'Robot'), id])
            redirect(action: "list")
            return
        }

        [robotInstance: robotInstance]
    }

    def edit(Long id) {
        def robotInstance = Robot.get(id)
        if (!robotInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'robot.label', default: 'Robot'), id])
            redirect(action: "list")
            return
        }

        [robotInstance: robotInstance]
    }

    def update(Long id, Long version) {
        def robotInstance = Robot.get(id)
        if (!robotInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'robot.label', default: 'Robot'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (robotInstance.version > version) {
                robotInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'robot.label', default: 'Robot')] as Object[],
                          "Another user has updated this Robot while you were editing")
                render(view: "edit", model: [robotInstance: robotInstance])
                return
            }
        }

        robotInstance.properties = params

        if (!robotInstance.save(flush: true)) {
            render(view: "edit", model: [robotInstance: robotInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'robot.label', default: 'Robot'), robotInstance.id])
        redirect(action: "show", id: robotInstance.id)
    }

    def delete(Long id) {
        def robotInstance = Robot.get(id)
        if (!robotInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'robot.label', default: 'Robot'), id])
            redirect(action: "list")
            return
        }

        try {
            robotInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'robot.label', default: 'Robot'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'robot.label', default: 'Robot'), id])
            redirect(action: "show", id: id)
        }
    }
}
