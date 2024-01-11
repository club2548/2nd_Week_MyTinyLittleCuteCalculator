
import UIKit

// todos라는 변수는 Todo 구조체를 빈배열로 생성.
//var categories: [Category] = []
//var todos: [Todo] = []


// MARK: - ViewController에 todoList라는 tableView와 plusButton이라는 UIButton과 그 액션을 구성
class ViewController: UIViewController {
    
    @IBAction func editButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationController = storyboard.instantiateViewController(withIdentifier: "InputViewController") as? InputViewController
        else {
            print("Error: Unable to instantiate InputViewController")
            return
        }
        
        if let PresentationController = destinationController.presentationController as? UISheetPresentationController {
            PresentationController.detents = [.medium()]
        }
        self.present(destinationController, animated: true)
    }
    @IBOutlet weak var editButton: UIButton!
    @IBAction func todoEdit(_ sender: UIButton) {
        if self.todoList.isEditing {
            self.editButton.setTitle("•••", for: .normal)
            self.todoList.setEditing(false, animated: true)
        } else {
            self.editButton.setTitle("Done", for: .normal)
            self.todoList.setEditing(true, animated: true)
        }
    }
    @IBOutlet weak var todoList: UITableView!
    @IBAction func plusButton(_ sender: UIButton) {
        
        // AlertController를 선언하고 action을 구성
        let alert = UIAlertController(
            title: "Add Todo",
            message: "Complete what you have to do!",
            preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive) {_ in
            // cancelButton번을 눌렀을 때, 수행할 작업
        }
        
        let addButton = UIAlertAction(title: "Add", style: .default) {_ in
            // addButton번을 눌렀을 때, 수행할 작업 : 타이틀에는 사용자 입력값인 newTask, isCompleted에는 false를 배열 Todo에 append시킨다.
            guard let newCategory = alert.textFields?[0].text else { return }
            guard let newTask = alert.textFields?[1].text else { return }
            let appendedTask = Todo(title: newTask, isCompleted: false)
            if let appendedCategory = Controller.shared.categories.firstIndex(where: {$0.header == newCategory}){
                Controller.shared.categories[appendedCategory].items.append(appendedTask)
            } else {
                Controller.shared.categories.append(Category(header: newCategory, items: [appendedTask]))
            }
            Controller.shared.saveUserDefaults(category: Controller.shared.categories)
            Controller.shared.readUserDefaults()
            self.todoList.reloadData()
        }
        
        alert.addAction(cancelButton)
        alert.addAction(addButton)
        alert.addTextField {textfield in textfield.placeholder = "Add a Category"}
        alert.addTextField {textField in textField.placeholder = "Add a New Task"}
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Controller.shared.readUserDefaults()
        todoList?.delegate = self
        todoList?.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(dataUpdated), name: NSNotification.Name(rawValue: "DataUpdated"), object: nil)
    }
    
    @objc func dataUpdated() {
        self.todoList.reloadData()
        print("reload Data")
    }
}

// MARK: - UITableView에 필요한 UITableViewdelegate와 UITableViewDataSource 프로토콜 채택
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // UITableViewDataSource의 필수 메소드 두 가지. numerOfRowsInSection과 cellForRowAt.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Controller.shared.categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Controller.shared.categories[section].header
    }
    
    // numberOfRowInSection은 각 섹션의 행 수를 결정하는 메소드. 입력된 todos 갯수만큼 행 수 결정.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Controller.shared.categories[section].items.count
    }
    
    // cellForRowAt은 TableView에 각 행에 대한 Cell을 제공하는 메소드. TodoListCell이라는 커스텀셀을 각 행에 불러온다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = Controller.shared.categories[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoListCell.reuseIdentifier, for: indexPath) as! TodoListCell
        cell.set(todoTitle: todo.title, valueChanged: todo.isCompleted)
        return cell
    }
    
    
    // Lv3. 각 행을 삭제하기 위해 추가한 메소드 두 가지. editingStyleForRowAt과 commit editingStyle
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // todos의 선택된 셀과 tableView의 열을 인덱스로 찾아서 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Controller.shared.categories[indexPath.section].items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            if Controller.shared.categories[indexPath.section].items.isEmpty {
                Controller.shared.categories.remove(at: indexPath.section)
                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .automatic)
            }
            Controller.shared.saveUserDefaults(category: Controller.shared.categories)
        }
    }
    
    
    // UITableViewDelegate에서 사용하는 메소드. TableView에서 Cell을 선택했을 때, 이벤트를 처리할 로직을 구현한다.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected:\(Controller.shared.categories[indexPath.section].items[indexPath.row])")
        
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let inputViewController = storyboard.instantiateViewController(withIdentifier: "InputViewController") as? InputViewController
        else {
            print("Error: Unable to instantiate InputViewController")
            return
        }
        
        inputViewController.selectedCategory = Controller.shared.categories[indexPath.section]
        inputViewController.selectedItem = Controller.shared.categories[indexPath.section].items[indexPath.row]
                
        if let PresentationController = inputViewController.presentationController as? UISheetPresentationController {
            PresentationController.detents = [.medium()]
        }
        self.present(inputViewController, animated: true)
    }
}

