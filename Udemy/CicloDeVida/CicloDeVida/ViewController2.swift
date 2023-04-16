//
//  ViewController2.swift
//  CicloDeVida
//
//  Created by Javier Rodríguez Gómez on 28/10/21.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Estoy en VC2 y se activó -> \(#function)")
        //#function lo que hace es poner el nombre de la propia función
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Estoy en VC2 y se activó -> \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Estoy en VC2 y se activó -> \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Estoy en VC2 y se activó -> \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Estoy en VC2 y se activó -> \(#function)")
    }
    
}
