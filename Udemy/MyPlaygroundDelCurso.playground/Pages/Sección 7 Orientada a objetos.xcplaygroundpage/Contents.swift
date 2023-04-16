import Foundation

// PROGRAMACIÓN ORIENTADA A OBJETOS

/*Se trata de una de las formas de programar que existen, y se basa en trabajar
 con objetos que se realacionan o interactúan entre sí. Un objeto puede ser por
 ejemplo una cadena String, y además tienen una serie de características:
 longitud, tamaño del texto, etc. Los objetos tienen métodos o funcionalidades.
 Los objetos se crean o instancia de una clase, que es como si fuera su tipo*/

// ESTRUCTURAS
//Son tipos de datos personalizados, relacionados con objetos
//Ejemplo de struct especializada en cuadrados con propiedades de ancho y alto
//Lo que incluye se llama propiedades, y puede ser lo que sea, incluso funciones
struct Cuadrados {
    var ancho = 10 //estos son propiedades
    var alto = 10
    func area() -> Int { //esto son métodos
        return ancho * alto
    }
}
var miCuadrado = Cuadrados()
miCuadrado.area() //esto es para acceder a sus propiedades


// CLASES
//Son como moldes para crear objetos
class claseAutomovil {
    var color = "neutro" //propiedades
    var numeroRuedas = 4
    var precio = 0
    func encender() -> Bool { //métodos, lo que puede hacer el objeto
        return true }
    func acelerar() -> Bool {
        return true }
}
//para crear un objeto es muy fácil, y para acceder a sus métodos es con punto
var miObjetoMazdaDeClase = claseAutomovil()
miObjetoMazdaDeClase.acelerar()
miObjetoMazdaDeClase.precio = 1000
print(miObjetoMazdaDeClase.precio)
//se le pueden asignar valores al objeto, pero el molde o clase no cambia,
//seguiría siendo precio=0

/*Estructuras y clases se escriben igual, solo cambia su palabra reservada. La
 diferencia estaría en la diferencia entre referencia y copia: en una referencia,
 si cambias algo haces mención a la propia referencia, y se cambia todo; sería
 el caso de las clases.
 Mientras que las copias son independientes unas de otras una vez que salen del
 molde, y al cambiar algo no cambian las demás. Sería el caso de las estructuras.*/

struct estructuraAutomovil { //es el mismo texto que claseAutomovil
    var color = "neutro"
    var numeroRuedas = 4
    var precio = 0
    func encender() -> Bool {
        return true }
    func acelerar() -> Bool {
        return true }
}
var miEstructuraMazda = estructuraAutomovil()
miEstructuraMazda.precio = 2000
print(miEstructuraMazda.precio)

//creamos otro objeto y estructura basada en los anteriores y cambio de precio
var miSegundoObjetoMazdaDeClase = miObjetoMazdaDeClase
var miSegundaEstructuraMazda = miEstructuraMazda
miSegundoObjetoMazdaDeClase.precio = 6000
miSegundaEstructuraMazda.precio = 8100
print(miObjetoMazdaDeClase.precio)          // 6000, se cambió por ser una referencia, viene de una clase
print(miEstructuraMazda.precio)             // 2000, se mantiene en el valor que le asignamos inicialmente, por ser una copia, viene de struct
print(miSegundoObjetoMazdaDeClase.precio)   // 6000, fue el precio que fijamos
print(miSegundaEstructuraMazda.precio)      // 8100, fue el precio que asignamos, viene de struct y no modifica a los otros

/*El que proviene de la estructura no modifica sus propiedades, son copias
 independientes. Mientras que el objeto creado de la clase sí modifica sus
 propiedades porque son referencias*/

// Las clases tienen lo que se llama "herencia", que es que se puede cambiar o hereder propiedades de unas clases a otras si están instanciadas, si se crearon una a partir de la otra. Al menos creo que es así.
