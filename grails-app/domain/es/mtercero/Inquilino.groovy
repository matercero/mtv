package es.mtercero

class Inquilino {
   
    String dni
    String nombre
    String apellidos
    String direccion
    String municipio
    String provincia
    int codigoPostal
    String mail
    int telefono
    String observaciones  
    
    String toString(){
        nombre + " " + apellidos
    }
    
     
    static constraints = {
        dni blank: false
        nombre blank: false
        apellidos blank: true
        direccion blank: true
        municipio blank: true
        codigoPostal blank: true
        provincia blank: true
        telefono(matches: "[1-9]{9}", maxsize: 9)
        mail email: true, nullable: true       
        observaciones nullable: true, maxsize : 99999 
    }
    
    static mapping = {
        table 'inquilino'
        version false
        id column: 'id'
        dni column: 'dni'
        nombre column: 'nombre'
        apellidos column: 'apellidos'
        direccion column: 'direccion'
        municipio column: 'municipio'
        codigoPostal column: 'codigoPostal'
        provincia column: 'provincia'
        mail column: 'mail'
        telefono column: 'telefono'
        observaciones column: 'observaciones'        
    }
}
