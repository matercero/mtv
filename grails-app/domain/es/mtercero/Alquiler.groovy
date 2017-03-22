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
        id   blank: false
        inquilino  blank: false
        propiedad  blank: false
        fechaInicio blank: false
        fechaFin  blank: false
        luzInicio  blank: false
        luzFin  blank: false
        aguaInicio  blank: false
        aguaFin  blank: false
        precio  blank: false
        observacion blank: false
    }
    
    static mapping = {
        table 'alquiler'
        version false
        id column: 'id'
        inquilino column: 'id_Inquilino'
        propiedad column: 'id_Propiedad'
        fechaInicio column: 'fechaInicio'
        fechaFin column: 'fechaFin'
        luzInicio column: 'luzInicio'
        luzFin column: 'luzFin'
        aguaInicio column: 'aguaInicio'
        aguaFin column: 'aguaFin'
        precio column: 'precio'        
    }
}