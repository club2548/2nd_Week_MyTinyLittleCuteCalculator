//
//  CollectionViewCell.swift
//  LotteriaKiosk
//
//  Created by t2023-m0026 on 12/26/23.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: MyCollectionViewCell.self)
    
    @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var menuPrice: UILabel!
    @IBOutlet var menuImage: UIImageView!
    
    
    func setMenu(menuTitle: String, price: Int, image: UIImage) {
        let numberFormatter : NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        menuName.text = menuTitle
        menuPrice.text = numberFormatter.string(for: price)
        menuImage.image = image
    }
}
