import Foundation

// Type casting o validación de tipos de datos
let myName = "Brais"
let myAge = 32
class MyClass {
    var name: String! // se usa ! para que tenga un init
    var age: Int!
}
let myClass = MyClass()
myClass.name = myName
myClass.age = myAge

let myArray: [Any] = [myName, myAge, myClass] // este array es correcto con diferentes tipos si lo definimos como tipo Any
// Podemos acceder a cada elemento del array y comprobar de qué tipo se trata:
for item in myArray {
    // Type casting
    if item is String {
        // Down casting, forzar a un tipo más restrictivo que Any
        // En esta condición ya sabremos que es string
        let myItemString = item as! String
        print("Tipo String: \(myItemString)")
    } else if item is Int {
        let myItemInt = item as! Int
        print("Tipo Int: \(myItemInt)")
    } else if item is MyClass {
        let myItemMyClass = item as! MyClass
        print("Tipo MyClass: \(myItemMyClass.name!) y \(myItemMyClass.age!)")
    }
}
// Lo anterior se puede hacer de forma más directa y sencilla, haciendo directamente el type casting: comprueba y transforma sobre la marcha:
for item in myArray {
    if let myItemString = item as? String {
        print("Tipo String: \(myItemString)")
    } else if let myItemInt = item as? Int {
        print("Tipo Int: \(myItemInt)")
    } else if let myItemMyClass = item as? MyClass {
        print("Tipo MyClass: \(myItemMyClass.name!) y \(myItemMyClass.age!)")
    }
}

// Tipos anidados
// Los tipos anidados son formas más complejas de enum y se usan mucho dentro de una clase para hacer comprobaciones
struct ChessPiece {
    let color: Color
    let type: PieceType
    
    enum Color: String {
        case white = "Blanca", black = "Negra"
    }
    
    enum PieceType: String {
        case king = "Rey", queen = "Reina", rock = "Torre", bishop = "Alfil", knight = "Caballo", pawn = "Peón"
        struct Number { //estructura anidada
            let number: Int
        }
        var number: Number {
            switch self { //self se refiere al enum PieceType
            case .king:
                return Number(number: 1)
            case .queen:
                return Number(number: 1)
            case .rock:
                return Number(number: 2)
            case .bishop:
                return Number(number: 2)
            case .knight:
                return Number(number: 2)
            case .pawn:
                return Number(number: 8)
            }
        }
    }
    
    var description: String {
        return "Hay \(type.number.number) piezas de ajedrez de color \(color.rawValue) y de tipo \(type.rawValue)"
    }
}

let myPiece = ChessPiece(color: .black, type: .rock)
print(myPiece.description)
