//
//  InputViewController.swift
//  MyTodoList
//
//  Created by t2023-m0026 on 1/9/24.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {
    
    // 각 textField의 초기값과 saveButton의 활성상태를 지정하기 위해 Outlet 선언
    @IBOutlet weak var todoCategoryTextField: UITextField!
    @IBOutlet weak var todoTitleTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    // 선택된 cell의 카테고리와 할 일을 저장하는 변수
    var selectedCategory : Category?
    var selectedItem : Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textField의 이벤트(입력값 변경)을 처리하기 위해 delegate 설정
        todoCategoryTextField.delegate = self
        todoTitleTextField.delegate = self
        
        // textField 초기설정
        setupTextFields()
    }
    
    // 선택된 카테고리와 아이템이 존재하면 해당 정보를 텍스트 필드에 텍스트로 표시
    func populateTextFields() {
        if let selectedCategory = selectedCategory, let selectedItem = selectedItem {
            todoCategoryTextField.text = selectedCategory.header
            todoTitleTextField.text = selectedItem.title
            saveButton.isEnabled = false
        }
    }
    
    // textField 초기설정 메소드
    private func setupTextFields() {
        // textField에 변경이 있을 때, 이벤트에 대한 액션 설정
        todoCategoryTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        todoTitleTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        // textField 초기값 설정 및 저장 버튼 상태 갱신
        populateTextFields()
        updateSaveButtonState()
    }
    
    // textField 값이 변경될 때 호출되는 메소드
    @objc private func textFieldDidChange(_ textField: UITextField) {
        // 변경된 상태에 따라 saveButton 상태 갱신
        updateSaveButtonState()
    }
    
    // saveButton의 상태를 업데이트하는 메소드
    private func updateSaveButtonState() {
        // 초기 설정된 카테고리(todoCategoryTextField.text)과 선택된 카테고리(selectedCategory?.header)
        // 초기 설정된 할 일(todoTitleTextField.text)과 선택된 할 일(selectedItem?.title)
        let categoryChanged = todoCategoryTextField.text != selectedCategory?.header
        let titleChanged = todoTitleTextField.text != selectedItem?.title
        saveButton.isEnabled = categoryChanged || titleChanged
    }
    @IBAction func saveButton(_ sender: UIButton) {
        guard let newCategoryHeader = todoCategoryTextField.text, let newTaskTitle = todoTitleTextField.text else {
            return
        }
        
        // 수정할 항목이 선택된 항목이라고 가정
            if var selectedCategory = selectedCategory, var selectedItem = selectedItem {
                // 수정된 헤더와 타이틀을 할당
                selectedCategory.header = newCategoryHeader
                selectedItem.title = newTaskTitle

                // Update the category and item in the shared Controller
                Controller.shared.updateCategory(selectedCategory, updatedItem: selectedItem)
            }
        
        // Update the category and item in the shared Controller
        
        // Save the updated categories to UserDefaults
        Controller.shared.saveUserDefaults(category: Controller.shared.categories)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "DataUpdated"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func todoCategoryInput(_ sender: UITextField) {
    }
    @IBAction func todoTitleInput(_ sender: UITextField) {
    }
}
