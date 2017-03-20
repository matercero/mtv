package es.mtercero


import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('ROLE_ADMIN')
class PropiedadController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Propiedad.list(params), model:[propiedadCount: Propiedad.count()]
    }

    def show(Propiedad propiedad) {
        respond propiedad
    }

    def create() {
        respond new Propiedad(params)
    }

    @Transactional
    def save(Propiedad propiedad) {
        if (propiedad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (propiedad.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond propiedad.errors, view:'create'
            return
        }

        propiedad.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'propiedad.label', default: 'Propiedad'), propiedad.id])
                redirect propiedad
            }
            '*' { respond propiedad, [status: CREATED] }
        }
    }

    def edit(Propiedad propiedad) {
        respond propiedad
    }

    @Transactional
    def update(Propiedad propiedad) {
        if (propiedad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (propiedad.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond propiedad.errors, view:'edit'
            return
        }

        propiedad.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'propiedad.label', default: 'Propiedad'), propiedad.id])
                redirect propiedad
            }
            '*'{ respond propiedad, [status: OK] }
        }
    }

    @Transactional
    def delete(Propiedad propiedad) {

        if (propiedad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        propiedad.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'propiedad.label', default: 'Propiedad'), propiedad.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'propiedad.label', default: 'Propiedad'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
