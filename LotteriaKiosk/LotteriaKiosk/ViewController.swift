//
//  ViewController.swift
//  LotteriaKiosk
//
//  Created by t2023-m0026 on 12/26/23.
//

import UIKit

// ViewController를 구성하는 요소는 1.카테고리(UIButton), 2.메뉴화면(UICollectionView), 3.장바구니(UITableView), 4.취소/결제(UIButton)
class ViewController: UIViewController, CategoryBarDelegate {
    
    // 1.카테고리 버튼.
    // 버튼들은 각 버튼에 해당하는 Protocol LotteriaMenu를 따르는 Structure들을 menus에 할당하고 menuCollection(메뉴화면)를 reload 한다. 그리고 항상 첫번째 메뉴로 돌아온다.
    // 2.메뉴화면(이미지, 이름, 가격)을 구성하는 menuCollection(UICollectionView)과
    // 3.장바구니(이름, 수량, 가격, +,-버튼)을 구성하는 cart(UITableView).
    @IBOutlet var menuCollection: UICollectionView!
    @IBOutlet weak var cart: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCollection.delegate = self
        menuCollection.dataSource = self
        cart.delegate = self
        cart.dataSource = self
        
        super.viewDidLoad()
        let categories = ["햄버거", "사이드", "음료"]
        let categoryBar = CategoryBar(categories: categories)
        categoryBar.delegate = self
        
        view.addSubview(categoryBar)
        categoryBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          categoryBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 230),
          categoryBar.leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 0),
          categoryBar.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
          categoryBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Images for RotatingImagesView
        let images = [UIImage(named: "event1")!, UIImage(named: "event2")!]
        
        // Create RotatingImagesView
        rotatingImagesView = RotatingImagesView(images: images)
        rotatingImagesView.delegate = self
        
        // Add RotatingImagesView to ViewController's view
        view.addSubview(rotatingImagesView)
        
        // Set constraints for RotatingImagesView
        rotatingImagesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rotatingImagesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            rotatingImagesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            rotatingImagesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            rotatingImagesView.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    func categoryButtonTapped(category: String) {
        switch category {
        case "햄버거":
            menus = HamburgerMenus()
            scrollToFirstItem()
        case "사이드":
            menus = SideMenus()
            scrollToFirstItem()
        case "음료":
            menus = DrinkMenus()
            scrollToFirstItem()
        default:
            break
        }

        menuCollection?.reloadData()
    }
}

extension ViewController: RotatingImagesViewDelegate {
    
    
    
    // Implement RotatingImagesViewDelegate method for image selection
    func didSelectImageAtIndex(index: Int) {
        print("Selected image at index: \(index)")
        // Add your custom logic for handling the selected image
    }
}
