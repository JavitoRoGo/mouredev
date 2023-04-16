import Foundation

// Extensiones
// Las extensiones básicamente lo que hacen es añadir unas determinadas caracterísitcas a un tipo de dato, de forma que todos esos tipos de datos pasan a tener esas propiedades o caracterísitcas
let myMeters: Double = 5
func metersToKm(meters: Double) -> Double {
    meters / 1000
}
// Esto se puede hacer con una extensión:
extension Double {
    var km: Double {
        self / 1000
    }
    var m: Double {
        self
    }
    var cm: Double {
        self * 100
    }
}
print(myMeters.km) // al acceder a las propiedades de la constante que es Double aparecen las nuevas extensiones


// Protocolos
// Define un modelo de métodos, propiedades y requisitos para que los adopte un enum, estructura o clase; un patrón o protocolo que debe cumplir la clase o estructura, un modelo que se debe implementar
protocol PersonProtocol {
    var name: String { get set }
    // get permite leer la propiedad, y set permite editarla o darle un valor
    var age: Int { get set }
    func fullName() -> String
}
struct Programmer: PersonProtocol {
    var name: String
    var age: Int
    var language: String
    func fullName() -> String {
        return "El nombre es \(name), edad \(age), y su lenguaje favorito es \(language)"
    }
}
struct Teacher: PersonProtocol {
    var name: String
    var age: Int
    var subject: String
    func fullName() -> String {
        return "El nombre es \(name), edad \(age), e imparte la asignatura de \(subject)"
    }
}
let myProgrammer = Programmer(name: "Brais", age: 32, language: "Swift")
let myTeacher = Teacher(name: "Juan", age: 44, subject: "Matemáticas")
print(myProgrammer.fullName())


// Protocolos delegados
// Es muy importante y hay que aprenderlo bien porque se usa mucho: nos permite comunicar dos clases en sentido inverso, notiifcar de una función a la anterior pero de forma asíncrona (no sabemos cuándo se hará)
class FirstClass: SecondClassProtocol {
    func callSecond() {
        let secondClass = SecondClass()
        secondClass.delegate = self
        secondClass.callFirst()
    }
    func call() {
        print("Estoy de vuelta")
    }
}
protocol SecondClassProtocol {
    func call()
}
class SecondClass {
    var delegate: SecondClassProtocol?
    func callFirst() {
        sleep(5) //función que duerme el ordenador durante un tiempo, 5s en este caso
        delegate?.call()
    }
}
let firstClass = FirstClass()
firstClass.callSecond()
