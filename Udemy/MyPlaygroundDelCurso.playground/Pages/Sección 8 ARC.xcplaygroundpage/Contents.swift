// ARC: automatic reference counting o contador automático de referencia
// Se usa para limpiar memoria usada por la app, porque según programamos creamos y quitamos referencias que van usando y ocupando memoria, y esto se usa para limpiar
// Swift usa un contador para cada vez que nombramos o usamos una instancia: retain count. Se inicia solo a cero cuando no haya referencias a esa instancia o clase o lo que sea


// Seguridad y manejo de memoria: no contó nada aprovechable


// CONTROL DE ACCESO
// Se trata de controlar el acceso a partes o bloques del código para que no sean accesibles o modificables. Los niveles de acceso son: open, public, internal, fileprivate y private. Estos niveles se pueden aplicar a class, struct, enum, var, let y func:
/*
    open y public permiten el acceso al objeto desde cualquier parte del código
    internal permite acceso solo dentro del módulo, dentro de la app que estamos construyendo
    fileprivate permite el acceso solo dentro del fichero
    private permite acceso solo dentro del bloque activo, lo que está entre las llaves
 
    Por defecto los objetos se crean como internal
 */



// PRECEDENCIA Y ASOCIATIVIDAD
// Trata sobre la prioridad en el orden de ejecución de los comandos: primero divisiones y multiplicaciones, y luego sumas y restas. Y como en matemáticas, se pueden usar paréntesis para asociar operaciones

// OPERADORES AVANZADOS
/*
Son operadores más complejos que prácticamente no los vamos a usar en el día a día, pero si hacen falta pues buscarlos en la documentación de Swift. Son de 4 tipos:
    - Operadores bit a bit: realizan operaciones con bits de tipo NOT, AND, OR y XOR
    - De desplazamiento: para desplzar bits
    - De desbordamiento: para manejar errores en valores por encima de su límite
    - Custom: para definir nuestros propios operadores
 */
