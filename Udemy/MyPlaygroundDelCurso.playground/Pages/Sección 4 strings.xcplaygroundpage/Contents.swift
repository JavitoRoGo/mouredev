import Foundation

// SECCIÓN 4: CARACTERES Y STRINGS

// String son cadenas de caracteres o texto, en una o varias líneas
let myString = "Texto en una línea"
let myStrin2 = """
Con tres dobles comillas
se puede escribir un string
en varias líneas
"""
let falseString = """
Así se escribe en varias líneas\
pero solo en el código\
y no en el resultado final
"""
let myEmptyString = "" // String vacío
let myEmptyString2 = String()

// Se puede "sumar" o concatenar infinitas cadetas de texto o strings
var variosStrings = "Hola" + " " + "¿qué tal?"
variosStrings += "\nHolita"

// Se pueden relacionar varias strings de forma sencilla con interpolación
let name = "Javi"
let country = "España"
let personalInfo = "Mi nombre es \(name) y vivo en \(country)"

// Se pueden comparar
let name1 = "Pepe"
let name2 = "Pepito"
name1 == name2 //devuelve el valor false

// Y se puede ver si contiene un valor u otra variable o constante
let myContent = "Hola Pepito"
myContent.contains(name2) //devuelve el valor true
myContent.isEmpty //sirve para buscar string vacíos. Aquí devuelve false
