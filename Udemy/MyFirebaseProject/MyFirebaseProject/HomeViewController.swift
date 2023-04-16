//
//  HomeViewController.swift
//  MyFirebaseProject
//
//  Created by Javier Rodríguez Gómez on 8/11/21.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FirebaseCrashlytics
import FirebaseRemoteConfig
import FirebaseFirestore
import FirebaseFirestoreSwift

enum ProviderType: String {
    case basic
    case google
}

class HomeViewController: UIViewController {
    
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var providerLabel: UILabel!
    @IBOutlet var closeSessionButton: UIButton!
    @IBOutlet var errorButton: UIButton!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    
    private let email: String
    private let provider: ProviderType
    
    private let db = Firestore.firestore()
    
    init(email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Inicio"
        navigationItem.setHidesBackButton(true, animated: false)
        
        emailLabel.text = email
        providerLabel.text = provider.rawValue
        
        // Guardar datos de autenticación para mantener la sesión
        let defaults = UserDefaults.standard
        defaults.set(email, forKey: "email")
        defaults.set(provider.rawValue, forKey: "provider")
        defaults.synchronize()
        
        // Remote config
        let remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.fetchAndActivate { (status, error) in
            if status != .error {
                let showErrorButton = remoteConfig.configValue(forKey: "show_error_button").boolValue
                
                let errorButtonText = remoteConfig.configValue(forKey: "error_button_text").stringValue
                
                DispatchQueue.main.async {
                    self.errorButton.isHidden = !showErrorButton
                    self.errorButton.setTitle(errorButtonText, for: .normal)
                }
            }
        }
    }
    
    @IBAction func closeSessionButtonAction(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "provider")
        defaults.synchronize()
        
        switch provider {
        case .basic:
            firebaseLogOut()
        case .google:
            GIDSignIn.sharedInstance.signOut()
            firebaseLogOut()
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func errorButtonAction(_ sender: Any) {
        // Envío de ID de usuario
        Crashlytics.crashlytics().setUserID(email)
        // Envío de claves personalizadas
        Crashlytics.crashlytics().setCustomValue(provider, forKey: "PROVIDER")
        // Envío de log de errores
        Crashlytics.crashlytics().log("Se ha pulsado el botón Forzar error")
        
        fatalError()
    }
    
    private func firebaseLogOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            // Se ha producido un error
        }
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        view.endEditing(true)
        
        db.collection("users").document(email).setData([
            "provider":provider.rawValue,
            "address":addressTextField.text ?? "",
            "phone":phoneTextField.text ?? ""
        ])
    }
    
    @IBAction func getButtonAction(_ sender: Any) {
        view.endEditing(true)
        
        db.collection("users").document(email).getDocument { (documentSnapshot, error) in
            if let document = documentSnapshot, error == nil {
                if let address = document.get("address") as? String {
                    self.addressTextField.text = address
                } else {
                    self.addressTextField.text = ""
                }
                if let phone = document.get("phone") as? String {
                    self.phoneTextField.text = phone
                } else {
                    self.phoneTextField.text = ""
                }
            } else {
                self.addressTextField.text = ""
                self.phoneTextField.text = ""
            }
        }
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        view.endEditing(true)
        
        db.collection("users").document(email).delete()
        self.addressTextField.text = ""
        self.phoneTextField.text = ""
    }
    
    
}
