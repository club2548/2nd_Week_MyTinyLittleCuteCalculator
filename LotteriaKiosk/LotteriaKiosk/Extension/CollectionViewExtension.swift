//
//  CollectionViewExtension.swift
//  LotteriaKiosk
//
//  Created by t2023-m0026 on 1/2/24.
//

import UIKit

// MARK: - UICollectionView 관련 extension
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 메뉴화면의 Item개수(== cell의 개수)는
    // 각 Structure에 담긴 메뉴이름(Array)의 개수만큼 불러온다.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.menuNames.count
    }
    
    // 각 셀에서 보여줄 데이터(메뉴이름, 가격, 이미지)는 카테고리 버튼으로 할당된 Structure에서 데이터를 불러온다.
    // ["메뉴이름"]에서 indexPath로 메뉴이름을,
    // ["메뉴이름": 가격]에서 메뉴이름을 key로 가격인 value를,
    // "메뉴이름"과 같은 파일 이름의 image를 Assets에서 불러온다. nil일 경우 기본값은 "더블클래식치즈버거"
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menuCell =  collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        
        let menuNames = menus.menuNames[indexPath.row]
        let menuPrices = Int(menus.menuPrices[menuNames] ?? 0)
        let menuImages = UIImage(named: menus.menuImages[menuNames] ?? "DoubleClassicCheeseBurger")
        
        menuCell.setMenu(menuTitle: menuNames, price: menuPrices, image: menuImages!)
        return menuCell
    }
    
        func addToCart(name: String, price: Int) {
            // 1. 장바구니(UITableView)에 메뉴 추가
            updateMenuQuantity(name: name)
            priceOfMenusInCart(name: name)
            print (priceOfMenusInCart(name: name))
    
            // 2. 장바구니에 메뉴 목록을 콘솔창에 출력
            print("장바구니에 추가된 메뉴 목록:")
            for (menu, quantity) in menusInCart {
                print("- \(menu) (\(quantity)개)")
            }
    
            // 3. 총 가격 계산 및 콘솔창에 출력
            let totalPrice = menusInCart.reduce(0) { (result, item) -> Int in
                let (_, quantity) = item
                return result + (quantity * Int(menus.menuPrices[name] ?? 0))
            }
            print("총 가격: ₩\(totalPrice)")
    
            // 4. selectedMenuQuantity 갱신(상품개수 += 1)
            let selectedMenuQuantity = menusInCart[name] ?? 0
    
    //        // 5. selectedMenuPrice 갱신
    //        let selectedMenuPrice = Int(price)
    
            // 6. sortedCart 갱신
            sortedCart = menusInCart.keys.sorted()
    
            // 7. 테이블 뷰 갱신
            cart.reloadData()
        }

    
    // menuCollection(UICollectionView)에서 사용자가 cell을 선택했을 때(사용자입력),
    // 선택한 cell의 메뉴이름과 가격을 함수 addToCart의 파라미터로 할당한다.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMenuName = menus.menuNames[indexPath.row]
        let selectedMenuPrice = Int(menus.menuPrices[selectedMenuName] ?? 0)
        print("You Tapped \(selectedMenuName)")
        print("\(selectedMenuName) is ₩\(selectedMenuPrice)")
        addToCart(name: selectedMenuName, price: selectedMenuPrice)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    // collectionView scroll 방향이 Horizontal일 때, 마지막 page의 나머지 cell이 보이지 않는 부분을 해결하는 구문
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellsPerRow = 3
        let spacing = 0

        let totalSpacing = spacing * (cellsPerRow - 1)
        let availableWidth = collectionView.frame.width - CGFloat(totalSpacing)
        let cellWidth = floor(availableWidth / CGFloat(cellsPerRow))

        let remainingWidth = availableWidth - cellWidth * CGFloat(menus.menuNames.count % cellsPerRow)
        let inset = max(0, remainingWidth / 2)

        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: inset)
    }
    
    // 카테고리 버튼을 눌렀을 때, 항상 첫 row(section)로 돌아오게 하는 메소드.
    func scrollToFirstItem() {
        if menus.menuNames.count > 0 {
            let indexPath = IndexPath(item: 0, section: 0)
            menuCollection.scrollToItem(at: indexPath, at: .left, animated: true)
        }
    }
}
