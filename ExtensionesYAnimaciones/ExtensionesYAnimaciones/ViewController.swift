//
//  ViewController.swift
//  ExtensionesYAnimaciones
//
//  Created by Javier Rodríguez Gómez on 25/3/21.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI
        // cada vez que queramos redondear un botón basta con aplicar la función round que creamos. Así de fácil. Y si quiero cambiar algún parámetro a todos los botones simplemente se cambia en la definición de la función y listo
        button1.round()
        button2.round()
        button3.round()

    }

    @IBAction func button1Action(_ sender: UIButton) {
        sender.bounce()
        // también se podría poner como button1.bounce()
    }
    @IBAction func button2Action(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func button3Action(_ sender: UIButton) {
        sender.jump()
    }
    
}

