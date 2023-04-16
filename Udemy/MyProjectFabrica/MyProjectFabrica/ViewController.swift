//
//  ViewController.swift
//  MyProjectFabrica
//
//  Created by Javier Rodríguez Gómez on 28/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    var tipoAutomovil: Int?

    @IBOutlet var botonCocheSencillo: UIButton!
    @IBOutlet var botonCocheMazda: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cocheSencilloAction(_ sender: Any) {
        tipoAutomovil = 0
        performSegue(withIdentifier: "segueSegundaPantalla", sender: self)
    }
    
    @IBAction func cocheMazdaAction(_ sender: Any) {
        tipoAutomovil = 1
        performSegue(withIdentifier: "segueSegundaPantalla", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? MySecondViewController {
            destino.tipoAuto = tipoAutomovil
        }
    }
}

