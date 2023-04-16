import Foundation


// FUNCIONES
/*Las funciones sin parámetro ni reciben ni devuelven nada, solo ejecutan el código
 que tengan en su interior. La sintaxis es:*/
func holaMundo(){
    print("Hola Mundo")
}
holaMundo()


// Funciones con un parámetro de entrada, que va entre los paréntesis
func cuadradoDeNumero(x:Int) {
    let numeroCuadrado = x * x
    print(numeroCuadrado)
}
cuadradoDeNumero(x: 10)
/*Como el parámetro x no queda muy claro a qué se refiere, se puede reescribir
 la función anterior de la siguiente forma para que sea más legible (en este sentido
 en Swift se prefiere nombres largos de funciones pero que describan lo mejor
 posible lo que hacen*/
func cuadradoDe(numero:Int){
    let numeroCuadrado = numero * numero
    print(numeroCuadrado)
}
cuadradoDe(numero: 10)
//Hace lo mismo pero queda más claro con numero que con x


//Funciones con varios parámetros y retorno, para aprovechar el resultado de la función fuera de la misma
func cuboDe(numero:Int) -> Int {
    let numeroCubo = numero * numero * numero
    return numeroCubo
}
let resultado = cuboDe(numero: 10)
//se puede hacer lo anterior porque esa función nos devuelve algo mediante return

//Con varios parámetros, estos se separan con comas
func saludarAlumno(nombre:String,mensaje:String) {
    print("Hola \(nombre), \(mensaje).")
}
saludarAlumno(nombre: "Pepe", mensaje: "hola")

//Los mensajes se pueden definir por default, por ejemplo:
func otroSaludarAlumno(nombre:String,mensaje:String = "bienvenido") {
    print("Hola \(nombre), \(mensaje)")
}
otroSaludarAlumno(nombre: "Juan")
//Pero el default se puede sobreescribir llamándolo con la función
otroSaludarAlumno(nombre: "Pedro", mensaje: "holita")

//Se puede devolver más de un valor
func listaNombres() -> [String] {
    let arrayNombres = ["José","María","Morelos"]
    return arrayNombres
}
var nombres = listaNombres()

//Uso de valores internos y externos
func notaPromedio(matemáticas materiaUno:Double,
                  química materiaDos:Double,
                  físca materiaTres:Double) -> Double {
    
    return (materiaUno + materiaDos + materiaTres)/3

} //usamos saltos de línea en la definición de parámetros para que sea más legible
/*matemáticas es el valor externo que sale al llamar la función, y materiaUno es
 el valor interno con el que se opera dentro de la función*/
let misNotas = notaPromedio(matemáticas: 9, química: 9.5, físca: 8.4)


/*Los closures son como funciones, es decir, son bloques de código que hacen algo
 concreto, pero que podemos asignar a una constante o variable, y no tienen nombre.
 Son bloques autocontenidos de código que se pueden pasar o se tienen que poder pasar
     por la aplicación; esto significa que se deben asignar con let o var.
 La sintaxis es parecida a una función:

 {
 (parámetros) -> valorRetorno in
 código
 }
 */
//Vamos a coger la función anterior y transformarla en closure
let miPrimerClosure = {
    (materiaUno:Double,materiaDos:Double,materiaTres:Double) -> Double in
    return (materiaUno + materiaDos + materiaTres)/3
}

miPrimerClosure(8.8,9.4,7.4)
//Al estar asignada se puede usar como argumento para lo que sea, como una función
print("La nota media fue \(miPrimerClosure(8.8,9.4,7.4)).")
