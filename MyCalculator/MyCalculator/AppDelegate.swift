//
//  AppDelegate.swift
//  MyCalculator
//
//  Created by Javier Rodríguez Gómez on 23/3/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Esto es lo primero que muestra y le decimos que haga setup que definimos más abajo
        
        // Setup
        setupView()
        
        return true
    }

    // MARK: - Private methods
    
    private func setupView() {
        
        // esto creo que es para iniciar la pantalla, indicando el tamaño y el controlador
        window = UIWindow(frame: UIScreen.main.bounds)
        // decimos de nuestro controlador para la imagen será el que creamos HomeViewController
        let vc = HomeViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
    }
    
}

