//
//  ViewController.swift
//  CicloDeVida
//
//  Created by Javier Rodríguez Gómez on 28/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Es llamada solo cuando la vista es creada (una sola vez). Es un buen momento para hacer cambios de UI ya que estás seguro que la vista ya fue cargada en memoria y tienes acceso a todos sus elementos y conexiones. Al ser un método que solo se manda a llamar una vez es un buen lugar para hacer cosas que sólo necesitas hacer una vez, por ejemplo, iniciar bases de datos o conexiones a servidores
        print("Estoy en VC1 y se activó -> \(#function)")
        //#function lo que hace es poner el nombre de la propia función
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Este método siempre se llama antes de que la vista del viewController se muestre en pantalla. Buen lugar para código que se requiere llamar cada vez que la vista se va a mostrar en pantalla; al ser potencialmente llamado tantas veces, aquí no se recomienda escribir código que solo se requiere ejecutar una sola vez. Ejemplo de uso sería usarlo para actualizar elementos de la UI que han cambiado cuando el usuario estaba en otra vista
        print("Estoy en VC1 y se activó -> \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Este método es llamado cuando la vista ya se desplegó en pantalla. Al ya estar seguro que dicha vista ya está en pantalla es buen lugar para iniciar procesos que pueden ser pesados para el CPU, y por lo tanto podrían ocasionar problemas al mostrar elementos de tu vista. Ejemplos: Iniciar música, sonidos, vídeo, animaciones o recolectar datos de un servidor
        print("Estoy en VC1 y se activó -> \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Este método es llamado antes de que la vista sea removida de la pantalla. Su uso no es muy común pero puedes usarla para iniciar limpieza o verificaciones
        print("Estoy en VC1 y se activó -> \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Este método se llama cuando la vista es removida de pantalla. Buen lugar para detener procesos que no se requieran cuando el usuario no ve esa pantalla que fue removida. Ejemplo: Detener música, llamadas a servidores o a dispositivos externos ligados a esa vista
        print("Estoy en VC1 y se activó -> \(#function)")
    }
    
}

