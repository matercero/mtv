package es.mtercero

class BootStrap {

    //do this before boot
    def init = { servletContext ->

        //adding some data
         10.times{ authorIndex ->
               Inquilino inquilino = new Inquilino(nombre: "Cliente ${authorIndex}").save()
         }
               
        10.times{ index ->               
            Propiedad propiedad = new Propiedad(alias: "Pdad ${index}").save()
        }
        
          //creating a user with ROLE_ADMIN
        User user = new User(username: 'admin', password: 'admin').save()
        Role role = new Role(authority: 'ROLE_ADMIN').save()
        UserRole.create(user, role)
      
    }

    //do this on stopping application
    def destroy = {
    }
}
