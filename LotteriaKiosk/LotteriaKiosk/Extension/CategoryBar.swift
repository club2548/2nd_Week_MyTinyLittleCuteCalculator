//
//  CategoryBar.swift
//  LotteriaKiosk
//
//  Created by t2023-m0026 on 1/2/24.
//

import UIKit

protocol CategoryBarDelegate: AnyObject {
    func categoryButtonTapped(category: String)
}

class CategoryBar: UIStackView {
    weak var delegate: CategoryBarDelegate?
    var buttonBackgroundImages: [String: UIImage] = [:]
    
    var selectedButton: UIButton?

    init(categories: [String]) {
        super.init(frame: .zero)
        axis = .horizontal
        distribution = .fillEqually
        spacing = 0

        for category in categories {
            let button = UIButton(type: .system)
            button.setTitle(category, for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
            button.addTarget(self, action: #selector(categoryButtonTapped(_:)), for: .touchUpInside)
            addArrangedSubview(button)
            
            // 각 버튼에 대한 배경 이미지 설정
            buttonBackgroundImages[category] = UIImage(named: "buttonSelected")
        }
        
        if let firstButton = arrangedSubviews.first as? UIButton,
            let backgroundImage = buttonBackgroundImages["햄버거"] {
            firstButton.setBackgroundImage(backgroundImage, for: .normal)
        }
        
        // HEX 컬러 코드를 UIColor로 변환하여 배경 색상 설정
        self.backgroundColor = UIColor(hex: "#FFF1E6")
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func categoryButtonTapped(_ sender: UIButton) {
        // 이전에 선택된 버튼의 폰트 색상 원래대로 돌리기
        selectedButton?.setTitleColor(UIColor.black, for: .normal)
        
        // 현재 눌린 버튼의 폰트 색상 변경
        sender.setTitleColor(UIColor.black, for: .normal)
        
        // 이전에 선택된 버튼의 배경 이미지 제거
//        selectedButton?.setBackgroundImage(nil, for: .normal)

        

        // 선택된 버튼 업데이트
        selectedButton = sender
        
        var category = ""
        if let selectedCategory = sender.title(for: .normal) {
            category = selectedCategory
            delegate?.categoryButtonTapped(category: category)
        }
        
        // 선택된 버튼에 배경 이미지 적용
        if let backgroundImage = buttonBackgroundImages[category] {
            sender.setBackgroundImage(backgroundImage, for: .normal)
        } else {
            // 해당하는 배경 이미지가 없으면 배경 이미지를 제거
            sender.setBackgroundImage(nil, for: .normal)
        }

        // 선택하지 않은 모든 버튼의 배경 이미지 제거
        for arrangedSubview in arrangedSubviews {
            if let otherButton = arrangedSubview as? UIButton, otherButton != sender {
                otherButton.setBackgroundImage(nil, for: .normal)
            }
        }
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
                hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

                var rgb: UInt64 = 0

                Scanner(string: hexSanitized).scanHexInt64(&rgb)

                let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
                let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
                let blue = CGFloat(rgb & 0x0000FF) / 255.0

                self.init(red: red, green: green, blue: blue, alpha: alpha)
            }
}
