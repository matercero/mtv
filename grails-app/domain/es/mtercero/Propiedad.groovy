package es.mtercero

class Propiedad {
    
    String alias
    String direccion
    String municipio
    int codigoPostal
    String provincia
    int contadorLuz
    int contadorAgua
    
    String toString(){
        alias
    }
   
    static constraints = {       
        alias blank: false
        direccion blank: false
        municipio blank: false
        codigoPostal blank: false
        provincia blank: false
        contadorAgua blank: false
        contadorLuz blank: false           
    }
}
