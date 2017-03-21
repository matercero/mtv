package es.mtercero

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('ROLE_ADMIN')
class AlquilerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Alquiler.list(params), model:[alquilerCount: Alquiler.count()]
    }

    def show(Alquiler alquiler) {
        respond alquiler
    }

    def create() {
        respond new Alquiler(params)
    }

    @Transactional
    def save(Alquiler alquiler) {
        if (alquiler == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (alquiler.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond alquiler.errors, view:'create'
            return
        }

        alquiler.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'alquiler.label', default: 'Alquiler'), alquiler.id])
                redirect alquiler
            }
            '*' { respond alquiler, [status: CREATED] }
        }
    }

    def edit(Alquiler alquiler) {
        respond alquiler
    }

    @Transactional
    def update(Alquiler alquiler) {
        if (alquiler == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (alquiler.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond alquiler.errors, view:'edit'
            return
        }

        alquiler.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'alquiler.label', default: 'Alquiler'), alquiler.id])
                redirect alquiler
            }
            '*'{ respond alquiler, [status: OK] }
        }
    }

    @Transactional
    def delete(Alquiler alquiler) {

        if (alquiler == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        alquiler.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'alquiler.label', default: 'Alquiler'), alquiler.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'alquiler.label', default: 'Alquiler'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
