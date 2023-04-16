//
//  ViewController.swift
//  MyNetWorkingProject
//
//  Created by Javier Rodríguez Gómez on 1/11/21.
//


// Para este proyecto usaremos la web gorest.co.in, que nos da información sobre accesos y protocolos de libre uso como si realmente tuviésemos interacción con un servidor

// También se usa la librería Alamofire de github


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = ""
        nameLabel.numberOfLines = 0
        emailLabel.text = ""
        emailLabel.numberOfLines = 0
        idLabel.text = ""
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }

    @IBAction func getUserAction(_ sender: Any) {
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.getUser(id: 123) { user in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = user.name
            self.emailLabel.text = user.email
            self.idLabel.text = user.id?.description
            
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
            
        }
    }
    
    @IBAction func addUserAction(_ sender: Any) {
        let newUser = NewUser(name: "MoureDev", email: "mouredev@test.com", gender: "Male", status: "Active")
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.addUser(user: newUser) { user in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = user.name
            self.emailLabel.text = user.email
            self.idLabel.text = user.id?.description
            
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
            
        }
    }
    
    @IBAction func updateUserAction(_ sender: Any) {
        let newUser = NewUser(name: "MoureDev 2", email: nil, gender: nil, status: nil)
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.updateUser(id: 123, user: newUser) { user in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = user.name
            self.emailLabel.text = user.email
            self.idLabel.text = user.id?.description
            
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
            
        }
    }
    
    @IBAction func deleteUserAction(_ sender: Any) {
        activityIndicator.startAnimating()
        
        let id = 1828
        
        NetworkingProvider.shared.deleteUser(id: id) {
            
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = "Se ha borrado el usuario con ID: \(id)"
            self.emailLabel.text = ""
            self.idLabel.text = ""
            
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
        }
    }
    
}

