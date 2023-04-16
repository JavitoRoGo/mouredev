import Foundation

// CONTADOR DE CICLOS FOR

var contador = 0
for _ in 1...4 { //for con Int y contador
    contador += 1
    print(contador)
}

var paises = ["ES","MX","JP"]
for pais in paises { //for con String y Array
    print(pais)
}

var paisesDictionary = ["ES":"España","MX":"Mexico","JP":"Japón"]
for pais in paisesDictionary {
    print(pais)
} //mejor de la siguiente forma, separando los componentes del dictionary en el for poniéndolos entre paréntesis
for (pais,significado) in paisesDictionary {
    print("\(pais) significa \(significado)")
}

// for también sirve para ver los componentes de un array, o también:
let numeros = [1,2,3,4,5,6,7,8,9]
var suma = 0
for numero in numeros {
    suma += numero //esto es lo mismo que suma=suma+numero
}
print("La suma de los números es \(suma)")

/* BUCLE WHILE
Ejecuta el código mientras se cumpla la condición: primero valora si
 se cumple la condición y luego ejecuta el código*/

var age = 10
while age < 18 {
    print("Eres menor de edad, te faltan \(18 - age) años")
    age += 1
} //se ejecuta todo lo anterior mientras se cumpla la condición
print("Ya eres mayor de edad")

/* BUCLE REPEAT WHILE se diferencia del anterior en que primero se ejecuta el código al menos una vez, y luego se evalúa la condición*/
var numeros1 = [1,2,3,4,5,6,7,8,9,10]
var indice = numeros1.count - 1 //el índice es el número de elementos -1 porque el ínidce empieza a contar en 0
repeat {
    numeros1.remove(at: indice)
    indice -= 1
    print("Hay \(numeros1.count) elementos")
    print("indice=\(indice)")
} while numeros1.count > 0

// Otro ejemplo es un pequeño programa para números aleatorios
var numAleatorio:Int //sin valor inicial
var n = 0
repeat {
    n += 1
    numAleatorio = Int.random(in: 1...10) // esta forma es más actual y más fácil de usar y recordar (vista en una pregunta de la lección 40)
    //numAleatorio = Int(arc4random_uniform(10)) // esta forma es la que usan en el vídeo pero es más antigua y heredada de Objective-C
    /*arc4random genera números aleatorios de forma automática; el 10 lo fijamos
     nosotros y es el límite superior; hay que transformarlo en Int porque
     por defecto es de tipo UInt32*/
    print("El ciclo se ha ejecutado \(n) veces")
    print("El número aleatorio es \(numAleatorio)")
} while (numAleatorio != 8)
print("Se acabó el ciclo aleatorio después de \(n) ciclos")
