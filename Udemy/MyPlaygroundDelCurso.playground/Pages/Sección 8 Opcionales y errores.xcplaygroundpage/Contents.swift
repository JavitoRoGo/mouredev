import Foundation

// Un opcional puede tener valor o ser nulo (nil), y se usan para evitar errores de código, como por ejemplo, al pasar un string a int: si es una letra no tendrá valor como int
let myString = "hola"
let myInt = Int(myString) // constante de tipo Int? y con valor nil en este caso

// Optional binding o enlace de opcionales, se usa para comprobar si existe un valor no nulo y acceder a la vez a su valor: se comprueba si es nil, y si no lo es se asigna el valor a la nueva constante. Obtenemos el valor desempaquetado o unwrap
var myOptionalString: String?
if let optionalValue = myOptionalString {
    print(optionalValue)
}

// El desempaquetado forzado se hace con el símbolo ! pero si el opcional no tiene valor el código falla
print(myOptionalString!)

// Optional chaining o concatenación de opcionales, que nos sirve para acceder a valores opcionales que están anidados:
class Student {
    var name: String?
    var book: Book?
}
class Book {
    var pages: Int?
}
let myStudent = Student()

print(myStudent.name)
print(myStudent.book?.pages)

if let pages = myStudent.book?.pages {
    print(pages)
}

// Una alternativa al desempaquetado con if-let es la llamada salida rápida: guard-let. En este caso, al tratarse de un playground el guard let debe ir dentro de una función
func myFunc() {
    guard let myString = myOptionalString else { return }
    print(myString)
}


// MANEJO DE ERRORES

func sum(firstNumber: Int?, secondNumber: Int?) throws -> Int {
    if firstNumber == nil {
        throw SumError.firstNumberNil
    } else if secondNumber == nil {
        throw SumError.secondNumberNil
    } else if firstNumber! < 0 || secondNumber! < 0 { // force unwrap porque en este punto sabemos que sí tienen valor
        throw SumError.numberNegative(firstNumber: firstNumber!, secondNumber: secondNumber!)
    }
    return firstNumber! + secondNumber!
}
// Definición de tipos de errores
enum SumError: Error {
    case firstNumberNil
    case secondNumberNil
    case numberNegative(firstNumber: Int, secondNumber: Int)
}
// Propagación de errores
do {
    print(try sum(firstNumber: 100, secondNumber: 50))
} catch SumError.firstNumberNil {
    print("El primer valor es nulo")
} catch SumError.secondNumberNil {
    print("El segundo número es nulo")
} catch SumError.numberNegative(let firstNumber, let secondNumber) {
    print("Hay algún número negativo: \(firstNumber) y \(secondNumber)")
}
