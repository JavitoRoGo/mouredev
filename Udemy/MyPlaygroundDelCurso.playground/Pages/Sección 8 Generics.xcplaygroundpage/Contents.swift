
// Genéricos. Permite escribir funciones variables de tipos flexibles
// Esta primera función de ejemplo a continuación permite la entrada solo de tipo Int:
func swapTwoInts(a: inout Int, b: inout Int) {
    // inout hace que el parámetro de entrada sea también salida, sin necesidad de designarlo con ->
    let tempA = a
    a = b
    b = tempA
}
var myFirstInt = 5
var mySecondInt = 10
print("El primer valor es \(myFirstInt) y el segundo valor es \(mySecondInt)")
swapTwoInts(a: &myFirstInt, b: &mySecondInt)
print("El primer valor es \(myFirstInt) y el segundo valor es \(mySecondInt)")

// Ahora veamos una función con genéricos que permite más entradas:
func swapTwoGenerics<T>(a: inout T, b: inout T) {
    let tempA = a
    a = b
    b = tempA
}
var myFirstGeneric = "Brais"
var mySecondGeneric = "Moure"
print("El primer valor es \(myFirstGeneric) y el segundo valor es \(mySecondGeneric)")
swapTwoGenerics(a: &myFirstGeneric, b: &mySecondGeneric)
print("El primer valor es \(myFirstGeneric) y el segundo valor es \(mySecondGeneric)")
// Esta función va a cambiar los valores para cualquier tipo de dato que introduzcamos
