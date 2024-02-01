//
//  CreateTodoViewController.swift
//  MyTodoList_UICoded
//
//  Created by t2023-m0026 on 1/29/24.
//

import UIKit

protocol CreateTodoDelegate : AnyObject {
    func addNewTodoItem(title: String, description: String, isCompleted: Bool)
    func updateComplete(item: TodoListItem, isCompleted: Bool)
}

class CreateTodoViewController: UIViewController {
    weak var delegate : CreateTodoDelegate?
    private var customTransitioningDelegate = CustomTransitioningDelegate()
        
    let titleTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "작업 이름"
        return textField
    }()
    
    let descriptionTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "설명"
        return textField
    }()
    
    let saveTodoButton: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .light)
        let image = UIImage(systemName: "arrow.up.circle.fill", withConfiguration : imageConfig)
        button.setImage(image, for: .normal)
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupModalStyle()
        addSubViews()
        autoLayout()
        setInteractions()
        self.titleTextfield.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    private func setupModalStyle() {
        modalPresentationStyle = .custom
        transitioningDelegate = customTransitioningDelegate
    }
    
    private func addSubViews() {
        self.view.addSubViews([
            titleTextfield, descriptionTextfield,saveTodoButton
        ])
    }
    
    private func autoLayout() {
        titleTextfield.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleTextfield.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            titleTextfield.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            titleTextfield.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16)
        ])
        
        descriptionTextfield.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionTextfield.leadingAnchor.constraint(equalTo: titleTextfield.leadingAnchor),
            descriptionTextfield.trailingAnchor.constraint(equalTo: titleTextfield.trailingAnchor),
            descriptionTextfield.topAnchor.constraint(equalTo: titleTextfield.bottomAnchor, constant: 16)
        ])
        
        saveTodoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveTodoButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            saveTodoButton.topAnchor.constraint(equalTo: descriptionTextfield.bottomAnchor, constant: 16)
        ])
    }
    
    private func setInteractions() {
        titleTextfield.addTarget(self, action: #selector(didEndOnExit), for: .editingDidEndOnExit)
        descriptionTextfield.addTarget(self, action: #selector(didEndOnExit), for: .editingDidEndOnExit)
        
        titleTextfield.addTarget(self, action: #selector(enableSaveButton), for: .editingChanged)
        saveTodoButton.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
    }
    @objc func didEndOnExit() {
        if titleTextfield.isFirstResponder {
            descriptionTextfield.becomeFirstResponder()
        } else if descriptionTextfield.isFirstResponder {
            didTapSave()
        }
    }
    
    @objc func enableSaveButton() {
        if titleTextfield.text!.isEmpty {
            saveTodoButton.isEnabled = false
        } else {
            saveTodoButton.isEnabled = true
        }
    }
    
    @objc func didTapSave() {
        guard let newTitle = titleTextfield.text else { return }
        guard let newDescription = descriptionTextfield.text else { return }
        delegate?.addNewTodoItem(title: newTitle, description: newDescription, isCompleted: false)
        
        dismiss(animated: true)
    }
}
