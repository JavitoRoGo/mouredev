//
//  UIButtonExtension.swift
//  ExtensionesYAnimaciones
//
//  Created by Javier Rodríguez Gómez on 25/3/21.
//

import UIKit

// la extensión se crea asÍ: con la primera línea se añade al objeto UIButton todo lo que escribamos dentro como funciones

extension UIButton {
    
    // Crear borde redondo. self se refiere a lo que estamos dentro, UIButton en este caso, y se puede omitir
    func round() {
        // cogemos la altura del botón, dividimos por dos y lo asignamos como valor del radio de curvatura
        self.layer.cornerRadius = bounds.height / 2
        // si el botón se ve deformado, el área se ajusta a esa deformación, y la curvatura también
        clipsToBounds = true
    }
    
    // Animación de rebote
    
    func bounce() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1) // se agranda un factor 1.1 tanto en X como en Y
        }) { (completion) in // aquí se pone ahora lo que tiene que hacer al terminar la acción, que sería volver a su forma original
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = .identity // que vuelva al tamaño original
            }) // aquí finalizamos la totalidad de la acción así que no lleva el bloque completion
        }
    }
    
    // Animación de brillar
    // es como el anterior pero cambiando el color para que parezca que brilla. Es con la propiedad alpha, que es como la opacidad
    
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5 // valor de la mitad de opacidad, es más transparente
        }) { (completion) in // aquí se pone ahora lo que tiene que hacer al terminar la acción, que sería volver a su forma original
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1 // que vuelva al valor original
            }) // aquí finalizamos la totalidad de la acción así que no lleva el bloque completion
        }
    }
    
    // Animación de salto
    // en este caso la propiedad que se transforma es la traslación
    
    func jump() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(translationX: 10, y: 0) // salta 10 pixel en X y 0 en Y
        }) { (completion) in // aquí se pone ahora lo que tiene que hacer al terminar la acción, que sería volver a su forma original
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = .identity // que vuelva al tamaño original
            }) // aquí finalizamos la totalidad de la acción así que no lleva el bloque completion
        }
    }
    
}

// La gran ventaja de esto es que puedo copiar la extension en cualquier otro proyecto y ya tengo listas estas propiedades y animaciones
