
// SETS O CONJUNTOS
// Colección de un único tipo de dato, sin orden concreto, pero con elementos únicos o sin duplicados
var mySet = Set<String>() //declarar Set vacío
let mySet2: Set<String> = ["Brais","Moure","32"] //inicializar Set con valores
let mySet3: Set = ["Brais","Moure","32"] //Set por inferencia de tipo

// Insertar de uno en uno:
mySet.insert("Brais")

// Acceso a valores
if mySet.contains("Moure") {
    // algo
} else {
    // algo
}

// Modificación
mySet.remove("32")

// Acceso y modificación por índice
if let index = mySet.firstIndex(of: "Brais") {
    mySet.remove(at: index)
}

// Iteración
mySet.insert("Brais")
mySet.insert("Moure")
mySet.insert("32")
mySet.insert("Swift")
mySet.insert("Brais")
for myElement in mySet {
    print(myElement)
}

// Operaciones de conjunto
let myIntSet: Set = [1,2,3,4,5]
let myIntSet2: Set = [0,2,3,6,7]
print(myIntSet.intersection(myIntSet2)) //Intersección
print(myIntSet.symmetricDifference(myIntSet2)) //Diferencia simétrica
print(myIntSet.union(myIntSet2)) //Unión, pero sin repetir
print(myIntSet.subtracting(myIntSet2)) //Sustracción



// ALGORITMOS APLICADOS A COLECCIONES
// Ordenar con sort: sólo es válida para arrays y NO para sets o dictionaries, que por definición no están ordenados (sus elementos no tienen posición fija)
var myArray = [1,2,5,6,7,3,4,9,8]
myArray.sort() //coge el array y lo ordena en sí mismo: cambia su valor porque lo ordena en el sitio
//mySet.sort() esto no es válido
// También se puede definir nuestro criterio de ordenación:
myArray.sort { (intA, intB) -> Bool in
    intA > intB //mayor a menor
}

// Con sorted es diferente porque no cambia la colección, sino que asigna o devuelve la nueva ordenación, por lo que sí es aplicable a sets
let myArraySorted = myArray.sorted()
mySet.sorted()



// ALGORITMOS TIPO MAPEO
// Transformar los valores de una colección en otra colección, de igual o distinto tipo
var myArray2 = [5,8,1,0,3,9,7,2,4,6]
let myDictionary = [5:"Cinco",
                    8:"Ocho",
                    1:"Uno",
                    0:"Cero",
                    3:"Tres",
                    9:"Nueve",
                    7:"Siete",
                    2:"Dos",
                    4:"Cuatro",
                    6:"Seis"]
var myOtherSet: Set = [5,8,1,0,3,9,7,2,4,6]
// Sumar 10 a cada elemento usando mapeo, que también permite asignarlo
let myMapArray = myArray2.map { (myInt) -> Int in
    return myInt + 10
}
print(myMapArray)
// Mapeo para cambiar el tipo de dato de salida
let myMapArray2 = myArray2.map { (myInt) -> String in
    return "Este es el número \(myInt)"
}
print(myMapArray2)
// También funciona con dictionaries y sets. Tener en cuenta que devuelve un array
myDictionary.map { (myElement) -> Int in
    myElement.key
} //crea array con las claves
let myStringSet = myOtherSet.map { (myInt) -> String in
    "\(myInt)"
} //devuelve array con los números pero pasados a string
print(myStringSet)



// FOREACH
// Es como for para recorrer las colecciones, pero más rápido y directo, está integrado como propiedad:
myArray2.forEach { (myInt) in
    print(myInt)
}
myDictionary.forEach { (myElement) in
    print(myElement.value)
}
myOtherSet.forEach { (myInt) in
    print(myInt)
}




// OTRAS OPERACIONES
// count para el número de elementos, isEmpty para saber si está vacío, reversed para invertir el orden. Y first y last para el primer o último valor de la colección; estos valores son opcionales porque pueden no existir; last solo está disponible para los arrays
print(myArray2.reversed() as [Int])
// popLast (solo en arrays) y popFirst (no en arrays) eliminan y devuelven el último o primer valor
print(myArray2.popLast()!)
print(myArray2)
print(myArray2)
myOtherSet.popFirst()

