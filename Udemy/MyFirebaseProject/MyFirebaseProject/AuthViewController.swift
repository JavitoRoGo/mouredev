//
//  AuthViewController.swift
//  MyFirebaseProject
//
//  Created by Javier Rodríguez Gómez on 8/11/21.
//

import UIKit
import Firebase
import FirebaseAnalyticsSwift
import FirebaseAuth
import GoogleSignIn
import FirebaseRemoteConfig

class AuthViewController: UIViewController {
    
    @IBOutlet var authStackView: UIStackView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var googleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Autenticación"
        
        // Analytics event
        Analytics.logEvent("InitScreen", parameters: ["message":"Integración de Firebase completa"])
        
        // Comprobar si el usuario está autenticado
        let defaults = UserDefaults.standard
        if let email = defaults.value(forKey: "email") as? String,
           let provider = defaults.value(forKey: "provider") as? String {
            authStackView.isHidden = true
            navigationController?.pushViewController(HomeViewController(email: email, provider: ProviderType.init(rawValue: provider)!), animated: false)
        }
        
        // Google auth
        //GIDSignIn.sharedInstance()?.presentingViewController = self
        //GIDSignIn.sharedInstance()?.delegate = self
        
        // Remote config
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 60
        
        let remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.configSettings = settings
        remoteConfig.setDefaults(["show_error_button":NSNumber(true), "error_button_text":NSString("Forzar error")])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        authStackView.isHidden = false
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                self.showHome(result: result, error: error, provider: .basic)
            }
        }
    }
    
    @IBAction func logInButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                self.showHome(result: result, error: error, provider: .basic)
            }
        }
    }
    
    @IBAction func googleButtonAction(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // Create Google Sign In configuration object
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
            guard error == nil else { return }
            guard let user = user else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken!, accessToken: user.authentication.accessToken)
            Auth.auth().signIn(with: credential) { (result, error) in
                self.showHome(result: result, error: error, provider: .google)
            }
        }
    }
    
    private func showHome(result: AuthDataResult?, error: Error?, provider: ProviderType) {
        if let result = result, error == nil {
            self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: provider), animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Se ha producido un error de autenticación mediante \(provider.rawValue)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alert, animated: true)
        }
    }
    
}

