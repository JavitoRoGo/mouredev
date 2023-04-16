//
//  Automovil.swift
//  MyProjectFabrica
//
//  Created by Javier Rodríguez Gómez on 28/10/21.
//

import Foundation

class Automovil {
    var color = "neutro"
    var numeroLlantas = 4
    var precio = 5000
    
    //el init no es de la lección, sino cosecha propia para practicar
    init() {
        color = "neutro"
        numeroLlantas = 4
        precio = 5000
    }
    init(color: String, num: Int, precio: Int) {
        self.color = color
        self.numeroLlantas = num
        self.precio = precio
    }
    
    func encender() -> Bool {
        return true
    }
    func apagar() -> Bool {
        return false
    }
    
    func acelerar() -> String {
        return "Acelerando"
    }
}
