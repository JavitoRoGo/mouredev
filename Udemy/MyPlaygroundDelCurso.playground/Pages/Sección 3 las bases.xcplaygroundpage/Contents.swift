// SECCIÓN 3: CONSTANTES, VARIABLES Y ASIGNACIÓN

// Import sirve para importar librerias
/* Una libreria es una colección de líneas de código
que podemos usar para no reiventar la rueda. */
import UIKit

/* Los comentarios sencillos también se pueden usar
 para "anular" temporalmente o poner como comentario
 líneas de código con error sin borrar el código,
 mientras encontramos el error */

var str = "Hello, playground"
str = "Hola Mundo"

let miEdad = 40
// miEdad = 41 esta expresión daría error porque miEdad se definió como constante

/* var es para variables, valores o parámetros que pueden variar
 o ir cambiando su valor a lo largo del código
 let es para constantes, o valores inmutables o fijos que no van a cambiar
 y nos interesa asegurar que son constantes para evitar errores*/

// se pueden definir varias var o let de golpe en la misma línea separándolas con coma
let niNombre = "Javier", miFecha = "20-7", miLugarDeNacimiento = "España"

/* Los operadores aritméticos solo funcionan con el mismo tipo de dato
 pero transformando los datos sí podemos sumarlos*/
var x = 18
var y = 18.8
var sumaInt = x + 2
var sumaDouble = y + 2.2
var suma = Double(x) + y //se transforma el tipo de x
var otraSuma = x + Int(y) //se transforma el tipo de y, pero solo coge la parte entera
var div = x / 5 /*este resultado solo muestra la parte entera. Si esperamos decimales
 en el resultado hay que fijarse bien en el tipo de la constante o variable*/
let xExplicit:Int = 2
let yExplicit:Double = 3.4
let zExplicit:String = "Así se define el tipo de valor de forma explícita, con :"
