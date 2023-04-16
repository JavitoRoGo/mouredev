//
//  ViewController.swift
//  MyProjectCollectionView
//
//  Created by Javier Rodríguez Gómez on 28/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    let myCountries = ["España","Mexico","Perú","Colombia","Argentina","EEUU","Francia","Italia"]
    
    private let myCellWidth = UIScreen.main.bounds.width / 2

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "MyCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mycell")
        //esta línea anterior es para añadir o registrar la celda que hemos creado
        
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        return myCountries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as? MyCustomCollectionViewCell
        cell?.myFirstLabel.text = myCountries[indexPath.row]
        return cell! //podemos forzarla porque el deque se encarga de crearla si no existiese
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.section) -> \(indexPath.row) -> \(myCountries[indexPath.row])")
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
// Extensión para controlar el tamaño de celda
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCellWidth, height: myCellWidth)
    }
    
}

