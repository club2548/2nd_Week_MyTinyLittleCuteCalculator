//
//  MyTableViewCell.swift
//  LotteriaKiosk
//
//  Created by t2023-m0026 on 1/2/24.
//

import UIKit
var menusInCart: [String : Int] = [:]
var menuPriceInCart: [String : Int] = [:]
var sortedCart: [String] = []

func updateMenuQuantity(name: String) {
    if let quantity = menusInCart[name] {
        menusInCart[name] = quantity + 1
    } else {
        menusInCart[name] = 1
    }
}

func priceOfMenusInCart(name: String) {
    menuPriceInCart["name"] = menus.menuPrices[name]
}

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

class MyTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: MyTableViewCell.self)
    
    @IBOutlet weak var selectedMenuName: UILabel!
    @IBOutlet weak var selectedMenuQuantity: UILabel!
    @IBOutlet weak var selectedMenuPrice: UILabel!
    
    @IBAction func quantityPlus(_ sender: UIButton) {
    }
    @IBAction func quantityMinus(_ sender: UIButton) {
    }
    
    func setCart(menuNameInCart: String, menuQuantityInCart: Int, menuPriceInCart: Int) {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        selectedMenuName.text = menuNameInCart
        selectedMenuQuantity.text = numberFormatter.string(for: menuQuantityInCart)
        selectedMenuPrice.text = numberFormatter.string(for: menuPriceInCart)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
