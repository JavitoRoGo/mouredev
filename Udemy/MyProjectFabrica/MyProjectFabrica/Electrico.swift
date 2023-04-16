//
//  Electrico.swift
//  MyProjectFabrica
//
//  Created by Javier Rodríguez Gómez on 28/10/21.
//

import Foundation

class AutomovilElectrico: Automovil {
    var porcentajeBateria = 100
    
    func cargarBateria() -> String {
        porcentajeBateria = 100
        return "Carga exitosa"
    }
}
