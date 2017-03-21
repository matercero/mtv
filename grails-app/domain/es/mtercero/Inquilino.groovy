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
}
