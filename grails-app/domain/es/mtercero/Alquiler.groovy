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
    
    Propiedad propiedad
    Inquilino inquilino
    
    static constraints = {      
    }
    
    static mapping = {
        table 'alquiler'
        version false
        id column: 'id'
        fechaInicio column: 'fechaInicio'
        fechaFin column: 'fechaFin'
        luzInicio column: 'luzInicio'
        luzFin column: 'luzFin'
        aguaInicio column: 'aguaInicio'
        aguaFin column: 'aguaFin'
        precio column: 'precio'
        inquilino column: 'id_Inquilino'
        propiedad column: 'id_Propiedad'
        
    }
}