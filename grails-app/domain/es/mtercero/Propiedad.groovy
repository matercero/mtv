package es.mtercero

class Propiedad {
    
    String alias
    String direccion
    String municipio
    int codigoPostal
    String provincia
    int contadorLuz
    int contadorAgua
    Alquiler alquiler
   
    static constraints = {       
           alquiler unique: false
    }
}
