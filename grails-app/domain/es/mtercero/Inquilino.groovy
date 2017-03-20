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
    Alquiler alquiler

    static constraints = {
        mail email: true
    }
}
