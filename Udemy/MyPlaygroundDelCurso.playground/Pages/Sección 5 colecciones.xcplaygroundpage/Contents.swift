import Foundation

// SECCIÓN 5: MÁS TIPOS DE DATOS Y ARREGLOS

// Booleans: son valores de verdadero o falso
let valor1 = true
let valor2 = false
let valor3 = 2>1 //devuelve el valor true
// Los Bool se pueden crear directamente o como resultado de alguna condición

/*Las COLECCIONES sirven para agrupar una serie de datos en una sola var o let
 Array es para un conjunto ordenado de valores
 Set no tiene en cuenta la posición y además NO se pueden repetir valores
 Dictionary almacena valores asociados a una clave única*/

//Lo más común son los array, para almacenar datos en uno solo, y siempre del mismo tipo
var arrayNumeros = [1,2,3]
let arrayNumerosFijos = [3,2,1]
print(arrayNumerosFijos) //Así muestra todos los valores
print(arrayNumerosFijos[0]) //Muestra el primer valor porque empieza a contar en 0

arrayNumeros.append(5) //Añade un valor al final del array
arrayNumeros.insert(4, at: 3) //Añade un valor en una posición concreta
arrayNumeros.removeLast() //borra el último valor
arrayNumeros.remove(at: 3) //borra el valor de la posición específica

var emptyArray:[Int] = [] //crea array vacío

/*Los diccionarios almacenan valores asociados a una clave. No se tiene en cuenta
 la posición de los elementos porque se buscan por la clave*/
let myClassicDictionary = Dictionary<Int, String>()
var myDictionary = [Int:String]() //esta es la forma que realmente se usa
myDictionary = [01:"Lucas",02:"Yago"] /*así se inicia un dictionary,
 si se repite esta orden se borran los datos anteriores*/
// Para añadir valores una vez iniciado es:
myDictionary[03] = "Javi"
myDictionary[04] = "Aurora"
myDictionary[05] = "Luigi"
myDictionary

myDictionary.removeValue(forKey: 05) //para borrar valores
myDictionary

// Los tuples permiten almacenar diferentes tipos de valores
var persona = ("Pepito","Perez",30,1.75)
persona.0 //así se accede a cada valor; devuelve el nombre
// Se puede asignar cada valor de la tuple a una var o let independiente
var (nombre, apellido, edad, estatura) = persona

//También se puede nombrar cada posición o clave como si fuera un dictionary
var personaNamedTuple = (nombre:"Pepito",apellido:"Perez",edad:30,estatura:1.75)
personaNamedTuple.nombre //devuelve el nombre

/* Las enumeraciones sirven para agrupar datos que tienen características en común.
 Por ejemplo, datos de usuario.
 Y nos aseguramos el tipo de dato que debe tener cada valor o case
 Es como un tipo de dato, que puede tomar solo los valores o case indicados.
 Aunque cada case puede tomar varios valores, que serían tuplas (enum con valores asociados) */
enum PersonalData {
    case name
    case surname
    case address
    case phone
}
var currentData: PersonalData = .name //define una variable del tipo de PersonalData e indica que toma el case .name
var input = "Pepito" //esto no lo entiendo bien

//Enumeraciones con valores asociados
enum ComplexPersonalData {
    case name(String)
    case surname(String,String)
    case address(String,Int)
    case phone(Int)
}
var complexCurrentData: ComplexPersonalData = .name("Pepito")
print(complexCurrentData)
complexCurrentData = .surname("Perez", "Perera")
print(complexCurrentData)
complexCurrentData = .address("Calle Falsa", 123)
print(complexCurrentData)
complexCurrentData = .phone(666666666)
/*Por lo que entiendo, con enum es como si definieras un "tipo" de valores, que luego se asocia
 a la variable con la que se trabaja para que tenga ese tipo de valor en cada case. Y de paso
 nos deja almacenar varios valores, como si fuera una colección.*/

enum RawPersonalData:String {
    case name = "Nombre" /*es lo que se mostraría en lugar de name, así
 se le da nombre a cada case o posición, se le asigna un rawValue*/
    case surname = "Apellido"
    case address = "Dirección"
    case phone = "Teléfono"
} //así son todos del mismo tipo y se les puede poner un nombre a cada case que se muestre en pantalla
RawPersonalData.phone.rawValue //esto nos dice el valor en bruto del tipo

// Range operators u operadores de rango
let arrayEjemplo = [0,10,20,30,40,50,60,70,80,90]
//Two-sided range operator
var subsetArray = arrayEjemplo[5] //así cogemos solo un valor del array, muestra 50
var subsetArray1 = arrayEjemplo[2...6] //se cogen los valores del rango, incluyendo el inferior y superior
var subsetArray2 = arrayEjemplo[2..<6]
// One-sided range operator
var subsetArray3 = arrayEjemplo[...4]
var subsetArray4 = arrayEjemplo[6...]
