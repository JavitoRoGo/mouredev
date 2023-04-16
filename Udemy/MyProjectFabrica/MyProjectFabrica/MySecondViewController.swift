//
//  MySecondViewController.swift
//  MyProjectFabrica
//
//  Created by Javier Rodríguez Gómez on 28/10/21.
//

import UIKit

class MySecondViewController: UIViewController {
    
    var tipoAuto: Int?
    var automovilNormal: Automovil?
    var autoElectrico: AutomovilElectrico?
    var encendido = false
        
    @IBOutlet var botonInfo: UIButton!
    @IBOutlet var imagen: UIImageView!
    @IBOutlet var botonEncender: UIButton!
    @IBOutlet var botonApagar: UIButton!
    @IBOutlet var botonAcelerar: UIButton!
    @IBOutlet var infoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if tipoAuto == 0 {
            automovilNormal = Automovil()
            imagen.image = UIImage(named: "autoSencillo")
            infoLabel.text = "Se creó un coche sencillo correctamente"
        } else {
            autoElectrico = AutomovilElectrico()
            autoElectrico?.color = "azul"
            autoElectrico?.precio = 8000
            imagen.image = UIImage(named: "autoElectrico")
            infoLabel.text = "Se creó un coche Mazda eléctrico correctamente"
        }
        
    }
    
    @IBAction func infoAction(_ sender: Any?) {
        if tipoAuto == 0 {
            infoLabel.text = """
El color del coche sencillo es \(automovilNormal!.color).
El número de ruedas es \(automovilNormal!.numeroLlantas).
El coche sencillo cuesta \(automovilNormal!.precio) rupias.
"""
        } else {
            infoLabel.text = """
El color del coche eléctrico es \(autoElectrico!.color).
El número de ruedas es \(autoElectrico!.numeroLlantas).
El coche eléctrico cuesta \(autoElectrico!.precio) rupias.
El porcentaje de batería es \(autoElectrico!.porcentajeBateria)%.
"""
        }
    }
    
    @IBAction func encenderAction(_ sender: Any) {
        if tipoAuto == 0 {
            if !encendido {
                encendido = automovilNormal!.encender()
                infoLabel.text = "El coche normal encendió correctamente"
            } else {
                infoLabel.text = "El coche normal ya está encendido"
            }
        } else {
            if !encendido {
                encendido = autoElectrico!.encender()
                infoLabel.text = "El coche eléctrico encendió correctamente"
            } else {
                infoLabel.text = "El coche eléctrico ya está encendido"
            }
        }
    }
    
    @IBAction func apagarAction(_ sender: Any) {
        if tipoAuto == 0 {
            if encendido {
                encendido = automovilNormal!.apagar()
                infoLabel.text = "El coche normal apagó correctamente"
            } else {
                infoLabel.text = "El coche normal ya está apagado"
            }
        } else {
            if encendido {
                encendido = autoElectrico!.apagar()
                infoLabel.text = "El coche eléctrico apagó correctamente"
            } else {
                infoLabel.text = "El coche eléctrico ya está apagado"
            }
        }
    }
    
    @IBAction func acelerarAction(_ sender: Any) {
        if tipoAuto == 0 {
            if encendido {
                infoLabel.text = "El coche normal está acelerando correctamente"
            } else {
                infoLabel.text = "El coche normal no puede acelerar porque está apagado"
            }
        } else {
            if encendido {
                if autoElectrico!.porcentajeBateria > 0 {
                    autoElectrico?.porcentajeBateria -= 10
                    infoLabel.text = "El coche eléctrico está acelerando correctamente (\(autoElectrico!.porcentajeBateria)% batería)"
                } else {
                    encendido = autoElectrico!.apagar()
                    infoLabel.text = "Se agotó la batería y el coche eléctrico se apagó"
                }
            } else {
                infoLabel.text = "El coche eléctrico no puede acelerar porque está apagado"
            }
        }
    }
}
