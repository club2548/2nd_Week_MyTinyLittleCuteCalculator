//
//  TableViewExtension.swift
//  LotteriaKiosk
//
//  Created by t2023-m0026 on 1/2/24.
//

import UIKit

// MARK: - UITableView관련 extension
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menusInCart.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.reuseIdentifier, for: indexPath) as! MyTableViewCell
        let selectedMenuName = sortedCart[indexPath.row]
        let selectedMenuQuantity = menusInCart[selectedMenuName] ?? 0
        let selectedMenuPrice = Int(menus.menuPrices[selectedMenuName] ?? 0)
        let totalMenuPrice = selectedMenuPrice * selectedMenuQuantity
        cartCell.setCart(menuNameInCart: selectedMenuName, menuQuantityInCart: selectedMenuQuantity, menuPriceInCart: totalMenuPrice)
        return cartCell
    }
}
