//
//  MyCustomCollectionViewCell.swift
//  MyProjectCollectionView
//
//  Created by Javier Rodríguez Gómez on 28/10/21.
//

import UIKit

class MyCustomCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var myFirstLabel: UILabel!
    @IBOutlet var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundColor = .lightGray
        
        myFirstLabel.font = .boldSystemFont(ofSize: 20)
        myFirstLabel.textColor = .blue
    }

}
