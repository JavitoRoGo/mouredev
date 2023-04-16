//
//  UIButtonExtension.swift
//  MyCalculator
//
//  Created by Javier Rodríguez Gómez on 26/3/21.
//

import UIKit

private let orange = UIColor(red: 254/255, green: 148/255, blue: 0/255, alpha: 1)

extension UIButton {
    
    // Borde redondo
    func round() {
        self.layer.cornerRadius = bounds.height / 2
        clipsToBounds = true // para que la imagen se ajuste al borde y no se vea nada fuera de ese borde (al hacer el borde redondo según la línea anterior)
    }
    
    // Brillar
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
    
    // Apariencia selección: Intercambiar colores de los botones entre el fondo y el texto
    func selectOperation(_ selected: Bool) {
        backgroundColor = selected ? .white : orange // if statement reducido
        setTitleColor(selected ? orange : .white, for: .normal)
    }

}
