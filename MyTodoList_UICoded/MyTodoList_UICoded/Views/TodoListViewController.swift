//
//  TodoListViewController.swift
//  MyTodoList_UICoded
//
//  Created by t2023-m0026 on 1/29/24.
//

import UIKit

class TodoListViewController: UIViewController {
    
    var todosCoreData = [TodoListItem]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Todo"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private let plusButton : UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 60, weight: .thin)
        let image = UIImage(systemName: "plus.circle.fill", withConfiguration : imageConfig)
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let todoListTable : UITableView = {
        let table = UITableView()
        table.register(TodoTableViewCell.self, forCellReuseIdentifier: TodoTableViewCell.reuseIdentifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        addSubViews()
        getAllItems()
        autoLayout()
        setInteractions()
        todoListTable.delegate = self
        todoListTable.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(dataUpdated), name: NSNotification.Name(rawValue: "DataUpdated"), object: nil)
    }
    
    @objc func dataUpdated() {
        self.todoListTable.reloadData()
        print("reload Data")
    }
    
    private func addSubViews() {
        self.view.addSubViews([titleLabel, plusButton, todoListTable])
    }
    
    private func autoLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0)
        ])
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusButton.widthAnchor.constraint(equalToConstant: 60),
            plusButton.heightAnchor.constraint(equalToConstant: 60),
            plusButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            plusButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 0)
        ])
        
        todoListTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todoListTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            todoListTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            todoListTable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            todoListTable.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
            
        ])
    }
    
    private func setInteractions() {
        plusButton.addTarget(self, action: #selector(didTapPlus), for: .touchUpInside)
    }
    
    @objc func didTapPlus() {
        let createTodoViewController = CreateTodoViewController()
        let transitionDelegate = CustomTransitioningDelegate()
        createTodoViewController.transitioningDelegate = transitionDelegate
        createTodoViewController.modalPresentationStyle = .custom
        
        createTodoViewController.delegate = self
        present(createTodoViewController, animated: true)
    }
}

// MARK: TableViewDelegate, TableViewDataSource
extension TodoListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("열 개수 : \(todosCoreData.count)")
        print("CoreData : \(todosCoreData)")
        return todosCoreData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todolistItem = todosCoreData[indexPath.row]
        print("\(indexPath.row + 1)번째 아이템 : \(todolistItem)")
        print("itemTitle : \(String(describing: todolistItem.itemTitle))")
        print("Bool : \(todolistItem.itemIsCompleted)")
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.reuseIdentifier, for: indexPath) as! TodoTableViewCell
        cell.setTableViewCell(title: todolistItem.itemTitle, description: todolistItem.itemDescription)
        return cell
    }
    
    
}

extension TodoListViewController : CreateTodoDelegate {
    func addNewTodoItem(title: String, description: String, isCompleted: Bool) {
        createItem(title: title, description: description, isCompleted: isCompleted)
        getAllItems()
        NotificationCenter.default.post(name: NSNotification.Name("DataUpdated"), object: nil)
    }
    
    func getAllItems() {
        do {
            todosCoreData = try context.fetch(TodoListItem.fetchRequest())
            DispatchQueue.main.async {
                self.todoListTable.reloadData()
            }
        }
        catch {
            // error
        }
    }
    
    func createItem(title: String, description: String, isCompleted: Bool) {
        let newItem = TodoListItem(context: context)
        newItem.itemTitle = title
        newItem.itemDescription = description
        newItem.itemIsCompleted = isCompleted
        newItem.itemCreateDate = Date()
        newItem.itemId = UUID()
        do {
            try context.save()
        }
        catch {
            // error
        }
    }
    
    func deleteItem(item: TodoListItem) {
        context.delete(item)
        do {
            try context.save()
        }
        catch {
            // error
        }
    }
    
    func updateItem(item: TodoListItem, updatedTitle: String, updatedDescription: String, isCompleted: Bool) {
        item.itemTitle = updatedTitle
        item.itemDescription = updatedDescription
        item.itemIsCompleted = isCompleted
        item.itemModityDate = Date()
        do {
            try context.save()
        }
        catch {
            // error
        }
    }
    
    func updateComplete(item: TodoListItem, isCompleted : Bool) {
        item.itemIsCompleted = isCompleted
        do {
            try context.save()
        }
        catch {
            // error
        }
    }
}
