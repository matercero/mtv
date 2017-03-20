package es.mtercero

class Alquiler {
 
    Date fechaInicio
    Date fechaFin
    int luzInicio
    int luzFin
    int aguaInicio
    int aguaFin
    int precio
    String observacion
    
    static hasOne = [propiedad: Propiedad, inquilino: Inquilino]
    
     static constraints = {
        propiedad unique: true
        inquilino unique: true
    }
}