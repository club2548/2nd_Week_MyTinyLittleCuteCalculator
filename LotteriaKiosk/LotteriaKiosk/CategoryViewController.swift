//
//  CategoryViewController.swift
//  LotteriaKiosk
//
//  Created by t2023-m0026 on 12/28/23.
//
import UIKit

//class CategoryViewController: UIViewController {
//    var mainViewController: ViewController?
//    
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    let categoryBar = createCategoryBar()
//    view.addSubview(categoryBar)
//    categoryBar.translatesAutoresizingMaskIntoConstraints = true
//    NSLayoutConstraint.activate([
//      categoryBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
//      categoryBar.leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 40),
//      categoryBar.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40),
//      categoryBar.heightAnchor.constraint(equalToConstant: 50)
//    ])
//  }
//  private func createCategoryBar() -> UIStackView {
//    let stackView = UIStackView()
//    stackView.axis = .horizontal
//    stackView.distribution = .fillEqually
//    stackView.spacing = 10
//    let categories = ["햄버거", "사이드", "음료"]
//    for category in categories {
//      let button = UIButton(type: .system)
//      button.setTitle(category, for: .normal)
//      button.addTarget(self, action: #selector(categoryButtonTapped(_:)), for: .touchUpInside)
//      stackView.addArrangedSubview(button)
//    }
//    return stackView
//  }
//    
//    
//  @objc private func categoryButtonTapped(_ sender: UIButton) {
//    if let category = sender.title(for: .normal) {
//        
//            switch category {
//            case "햄버거":
//                menus = HamburgerMenus()
//            case "사이드":
//                menus = SideMenus()
//            case "음료":
//                menus = DrinkMenus()
//            default:
//                break
//            }
//            
//        mainViewController?.menuCollection?.reloadData()
//    }
//  }
//}
