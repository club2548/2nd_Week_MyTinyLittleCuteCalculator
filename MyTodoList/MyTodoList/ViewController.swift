
import UIKit

// MARK: - ViewController에 todoList라는 tableView와 plusButton이라는 UIButton과 그 액션을 구성
class ViewController: UIViewController {
    
    @IBOutlet weak var todoListEditButton: UIButton!
    @IBAction func todoEdit(_ sender: UIButton) {
        if self.todoList.isEditing {
            self.todoListEditButton.setTitle("•••", for: .normal)
            self.todoList.setEditing(false, animated: true)
        } else {
            self.todoListEditButton.setTitle("Done", for: .normal)
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
    // section의 개수는 Category 구조체 배열의 요소들의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return Controller.shared.categories.count
    }
    
    // section의 이름은 Category의 header와 같음
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Controller.shared.categories[section].header
    }
    
    // numberOfRowInSection은 각 섹션의 행 수를 결정하는 메소드. 입력된 Category의 Todo 구조체 배열의 요소들의 수만큼 행 수 결정.
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
    
    // categories에 저장된 section과 item을 인덱스로 찾아서 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Controller.shared.categories[indexPath.section].items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            // section 내 item이 없으면 section 삭제
            if Controller.shared.categories[indexPath.section].items.isEmpty {
                Controller.shared.categories.remove(at: indexPath.section)
                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .automatic)
            }
            // 삭제가 끝나면 UserDefaults 저장
            Controller.shared.saveUserDefaults(category: Controller.shared.categories)
        }
    }
    
    
    // Cell 선택 시 선택한 cell에 담긴 내용을 InputViewController로 불러와 category와 title을 수정
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
        inputViewController.selectedIndexPath = indexPath
                
        if let PresentationController = inputViewController.presentationController as? UISheetPresentationController {
            PresentationController.detents = [.medium()]
        }
        self.present(inputViewController, animated: true)
    }
}

