package es.mtercero

import grails.plugin.springsecurity.annotation.Secured

import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('ROLE_ADMIN')
class InquilinoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Inquilino.list(params), model:[inquilinoCount: Inquilino.count()]
    }

    def show(Inquilino inquilino) {
        respond inquilino
    }

    def create() {
        respond new Inquilino(params)
    }

    @Transactional
    def save(Inquilino inquilino) {
        if (inquilino == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (inquilino.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond inquilino.errors, view:'create'
            return
        }

        inquilino.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'inquilino.label', default: 'Inquilino'), inquilino.id])
                redirect inquilino
            }
            '*' { respond inquilino, [status: CREATED] }
        }
    }

    def edit(Inquilino inquilino) {
        respond inquilino
    }

    @Transactional
    def update(Inquilino inquilino) {
        if (inquilino == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (inquilino.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond inquilino.errors, view:'edit'
            return
        }

        inquilino.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'inquilino.label', default: 'Inquilino'), inquilino.id])
                redirect inquilino
            }
            '*'{ respond inquilino, [status: OK] }
        }
    }

    @Transactional
    def delete(Inquilino inquilino) {

        if (inquilino == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        inquilino.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'inquilino.label', default: 'Inquilino'), inquilino.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'inquilino.label', default: 'Inquilino'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
