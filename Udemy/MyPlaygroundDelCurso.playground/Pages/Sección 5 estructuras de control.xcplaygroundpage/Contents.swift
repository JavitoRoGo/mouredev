import Foundation

var numeroVariable = 2
// Operadores compuestos
numeroVariable += 2 //suma dos a sí mismo y le asigna el nuevo resultado
numeroVariable -= 2
numeroVariable *= 2
numeroVariable /= 2

var x = 1
var y = 2
// Operadores compuestos de comparación
x == y //devuelve false
x != y //devuelve true
x <= y //devuelve true
x >= y //devuelve false

// Los operadores lógicos son && (and), || (or) y !(not) y se usan en operadores condicionales, como la sentencia IF-ELSE
let edad = 17
let dinero = 1000
let sexoFemenino = false

if edad >= 18 { //este Bool es false
    print("Sí entras")
} else {
    print("No entras")
}

if edad >= 18 || dinero > 250 { //este Bool es true
    print("Sí entras")
} else {
    print("No entras")
}

if (edad >= 18 || dinero > 250) && (sexoFemenino) { //este Bool es false
    print("Sí entras")
} else {
    print("No entras")
}

/* Si hay muchas condiciones, para que sea más sencillo de ver se pueden usar
 if anidados. Por lo que entiendo, al estar anidados es como usar && */
if edad >= 18 {
    if dinero > 250 {
        print("Sí entras por ser mayor Y tener dinero")
        if sexoFemenino {
            print(" y además eres chica")
        }
    }
} else { //también se pueden usar varios else if
    print("No entras")
}

// Para muchas condiciones, la alternativa es la sentencia SWITCH
let country = "ES"
switch country {
case "ES":
    print("El idioma es español")
case "MX":
    print("El idioma es español")
case "PE":
    print("El idioma es español")
case "CO":
    print("El idioma es español")
case "ARG":
    print("El idioma es español")
case "EEUU":
    print("El idioma es inglés")
default: //siempre va un default porque tiene que ser exhaustivo y cubrir todos los valores
    print("No conocemos el idioma")
}

let age = 20
switch age {
case 0,1,2: //se pueden dar varios valores a un case
    print("Eres un bebé")
case 3...10: //se pueden usar rangos cerrados
    print("Eres un niño")
case 11..<16: //y rangos abiertos
    print("Eres un adolescente")
case 16..<70:
    print("Eres un adulto")
case 70...99:
    print("Eres un anciano")
default:
    print("😄👍")
}

// SWITCH con ENUM, ver final del vídeo 36
enum PersonalData {
    case name
    case surname
    case address
    case phone
}
var currentData = PersonalData.phone

switch currentData {
case .name:
print("Estamos editando el nombre")
case .surname:
print("Estamos editando el apellido")
case .address:
print("Estamos editando la dirección")
case .phone:
print("Estamos editando el número de teléfono")
} /* switch con enum no lleva el default porque es exhaustivo y cubre todos los
 casos o posibles valores, porque están definidos y cerrados en el enum*/
