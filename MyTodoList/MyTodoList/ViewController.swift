
import UIKit

// Todo라는 struct를 생성. String타입의 title과 Boolean타입의 isCompleted를 선언
struct Todo {
    let title : String
    let isCompleted : Bool = false
}

// UITableView에 필요한 UITableViewdelegate와 UITableViewDataSource 프로토콜 채택
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //스토리보드에서 UITableView를 ViewController 클래스에 연결(Connect).
    @IBOutlet weak var todoList: UITableView!
    
    // todos라는 변수는 Todo 구조체를 빈배열로 생성.
    var todos: [Todo] = []
    
    // View가 Load된 시점에서 DataSource와 Delegate를 self로 설정하여, 해당 데이터를 제공하는 객체와 이벤트를 처리하는 객체를 자기가신인 ViewController로 지정한다.
    // 그리고 UITableView에서 사용할 Cell들을 등록하고, 해당 TableView를 ViewController의 SubView로 올려준다.
    // 이건 설명을 못하겠고.. ViewController가 UITableViewDelegate, UITableViewDataSource 프로토콜을 상속할 때, 어쩌구 저쩌구인데
    override func viewDidLoad() {
        super.viewDidLoad()
        todoList.delegate = self
        todoList.dataSource = self
        todoList.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        todoList.register(UINib(nibName: "TodoListCell", bundle: nil), forCellReuseIdentifier: "TodoListCell")
        todoList.register(TodoListCell.self, forCellReuseIdentifier: "TodoListCell")
    }
    
    // UITableViewDataSource가 필수적으로 구현해야할 메소드 두 가지.
    
    // 첫번째 메소드는 행 수를 결정하는 메소드. section은 TableView의 섹션을 나타내는 식별자이고, 이를 바탕으로 해당 섹션에 count를 반환해준다.
    // 이건 UITableView에 몇 개의 열을 쓸 건지 반환값으로 결정하는 건데 뭐라고 설명해야할지 모르겠다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
//    이제 버튼이 셀과 함께 생성되어서 .isCompleted를 변경해줘야하는데.. 생성시점과 위치를 못잡겠습니다.
//    func setCompleteSwitch() {
//        let completeSwitch = UISwitch()
//        completeSwitch.isOn = true
//        completeSwitch.onTintColor = UIColor.green
//        completeSwitch.thumbTintColor = UIColor.white
//        completeSwitch.addTarget(todos, action: #selector(switchValueChanged), for: .valueChanged)
//        completeSwitch.frame = CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
//        self.view.addSubview(completeSwitch)
//    }
//    func switchValueChanged(_ sender: UISwitch) {
//        if sender.isOn {
//            //켜져있을 때는 .isCompleted = false
//        } else {
//            //꺼져있을 때는 .isCompleted = true
//        }}
    
    
    // 두번째 메소드는 TableView에 각 행에 대한 Cell을 제공하는 메소드. "Cell"이라는 식별값을 가진 View를 TableView의 각 행으로 사용한다. indexPath는 이 TableView에서 row행을 찾는 경로이다. 이를 바탕으로 적절한 Cell을 반환한다. 해당 TableView의 셀은 직접 만들어서(xib 또는 코드로 직접) 사용할 수 있다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell", for: indexPath) as! TodoListCell
        // 아래
        cell.textLabel?.text = todos[indexPath.row].title
        todos[indexPath.row].isCompleted
        return cell
    }
    
    // UITableViewDelegate에서 사용하는 메소드. TableView에서 Cell을 선택했을 때, 이벤트를 처리할 로직을 구현한다. indexPath는 TableView에서 선택된 row행을 찾는 경로. 이를 바탕으로 어떤 행이 선택되어있는지 판단할 수 있다.
    // 아래 예제는 어떤 데이터가 선택되었는지 정보를 출력하고
    // deselectRow라는 손을 뗐을 때, 선택을 해제하는 속성이 부여되어있다.
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected: \(todos[indexPath.row].title)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func plusButton(_ sender: UIButton) {
        // AlertController에 사용될 action 버튼(plusButton)을 선언
        
        // AlertController를 선언하고 action을 구성
        let alert = UIAlertController(
            title: "제목입니다.",
            message: "설명입니다.",
            preferredStyle: .alert)
        
        // button1은 "1번"이라는 타이틀을 가진 destructive 형태의 버튼(.destructive)
        let button1 = UIAlertAction(title: "1번", style: .destructive) {(action1) in
            // 1번을 눌렀을 때, 수행할 작업
        }
        
        // button1은 "2번"이라는 타이틀을 가진 기본형태의 버튼(.default)
        let button2 = UIAlertAction(title: "2번", style: .default) {(action2) in
            // 2번을 눌렀을 때, 수행할 작업 : 타이틀에는 사용자 입력값인 newTask, isCompleted에는 false를 배열 Todo에 append시킨다.
            guard let newTask = alert.textFields?.first?.text else { return }   // alert.textFields 배열의 첫번째 String을 newTask로 초기화한다. 아무것도 입력하지 않으면 return.
            self.todos.append(Todo(title: newTask))
            self.todoList.reloadData()  //이건 구글링해서 따라친 부분. 공부하지 않음. todoList를 다시불러오는
        }
        
        alert.addAction(button1)
        alert.addAction(button2)
        alert.addTextField(configurationHandler: {textField in textField.placeholder = "add New Task"})

        self.present(alert, animated: true, completion: nil)
    }
}

