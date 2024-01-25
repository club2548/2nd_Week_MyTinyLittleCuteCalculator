//
//  TodoViewController.swift
//  MyTodoList_UICoded
//
//  Created by t2023-m0026 on 1/11/24.
//

import UIKit

// rootViewController인 TodoViewController에 들어갈 요소들을 선언
//
// 각 요소들이 가진 기능들은 @objc func으로 선언
// 선언된 요소들을 addSubView하는 별도의 메서드
//
class TodoViewController: UIViewController {
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "image")
        return imageView
    }()
    
//    let mainImageView: UIImageView {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "image")
//        return imageView
//    }
    
    let todoButton: UIButton = {
        let button = UIButton()
        button.setTitle("할 일 확인하기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    let dogButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "cat"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        makeAutoLayout()
        
    }
    
//    private func setupInteraction() {
//        todoButton.addTarget(self, action: #selector(touchTodoButton()), for: .touchUpInside)
//        dogButton.addTarget(self, action: #selector(touchDogButton()), for: .touchUpInside)
//    }
    
    @objc func touchTodoButton() {
        
    }
    
    @objc func touchDogButton() {
        
    }
    
    private func addSubViews() {
        view.addSubview(mainImageView)
        view.addSubview(todoButton)
        view.addSubview(dogButton)
    }
    
    // 각 subView들에 대한 AutoLayout을 설정하는 메서드
    private func makeAutoLayout() {
        // mainImageView가 AutoLayout을 사용하도록 설정
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        // mainImageView의 영역별 제약조건 설정 구문. 대괄호 안에 쉼표로 한 번에 표시
        NSLayoutConstraint.activate([
            // mainImageView의 가로 중앙선과 view의 중앙선을 0만큼 띄운다.
            mainImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            // mainImageView의 세로 중앙정렬 제약조건 설정
            mainImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -200),
            // mainImageView의 가로크기를 200 포인트로 설정하는 제약조건 설정
            mainImageView.widthAnchor.constraint(equalToConstant: 200),
            // mainImageView의 세로크기를 100 포인트로 설정하는 제약조건 설정
            mainImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // 위와 같음
        todoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todoButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            todoButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100),
            todoButton.widthAnchor.constraint(equalToConstant: 110),
            todoButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // 위와 같음
        dogButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dogButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            dogButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            dogButton.widthAnchor.constraint(equalToConstant: 100),
            dogButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

