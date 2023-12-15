import Foundation

class Menu {
    func choiceDisplay() {}
    func commandInput() {}
}                      // 모든 클래스는 Menu를 상속

class CategoryData {
    
    var listOfMainMenu: Array<String> = [
        "Burgers         ",
        "Frozen Custard  ",
        "Drinks          ",
        "Beer            ",
        "ShoppingCart    "
    ]               // 메인 메뉴를 담은 배열
    
    var introOfMainMenu: Dictionary<String, String> = [
        "Burgers         ": "앵거스 비프 통살을 다져만든 버거",
        "Frozen Custard  ": "매장에서 신선하게 만드는 아이스크림",
        "Drinks          ": "매장에서 직접 만드는 음료",
        "Beer            ": "뉴욕 브루클린 브루어리에서 양조한 맥주",
        "ShoppingCart    ": "지금까지 선택한 상품들을 확인합니다."
    ] // 메뉴:설명을 담은 딕셔너리
}              // 각 카테고리(버거, 아이스크림 등)의 이름(배열)과 설명(dic)으로 기입

class ItemData {
    var burgerNameList: Array<String> = [
        "Shack Burger          ",
        "Smoke Shack           ",
        "Shroom Burger         ",
        "Cheese burger         ",
        "Hamburger             ",
        "Kimchi                "
    ]                 // 버거 이름을 담은 배열
    
    var frozenCustardNameList: Array<String> = [
        "Nilla Nilla Vanilla   ",
        "Cho.choc Chocolate    ",
        "Ni Ur Ghul Banana     ",
        "No Zam                ",
        "You Mom Alien?        "
    ]          // 아이스크림 이름을 담은 배열
    
    var drinkNameList: Array<String> = [
        "Coca-Cola             ",
        "Sprite                ",
        "Orange Juice          ",
        "Coca-Cola zero        ",
        "Sprite zero           "
    ]                  // 음료 이름을 담은 배열
    
    var beerNameList: Array<String> = [
        "Beer1                 ",
        "Beer2                 ",
    ]                   // 맥주 이름을 담은 배열
    
    var priceOfMenu: Dictionary<String, Double> = [
        "Shack Burger          ": 8.9,
        "Smoke Shack           ": 8.9,
        "Shroom Burger         ": 9.4,
        "Cheese burger         ": 6.9,
        "Hamburger             ": 5.4,
        "Kimchi                ": 8.0,
        "Beer1                 ": 6.9,
        "Beer2                 ": 8.9,
        "Coca-Cola             ": 6.9,
        "Sprite                ": 8.9,
        "Orange Juice          ": 9.4,
        "Coca-Cola zero        ": 6.9,
        "Sprite zero           ": 5.4,
        "Nilla Nilla Vanilla   ": 6.9,
        "Cho.choc Chocolate    ": 8.9,
        "Ni Ur Ghul Banana     ": 9.4,
        "No Zam                ": 6.9,
        "You Mom Alien?        ": 5.4
        
        
    ]       // 모든 메뉴:가격을 담은 딕셔너리
    
    var introOfMenu: Dictionary<String, String> = [
        "Shack Burger          ": "토마토, 양상추, 쉑소스가 토핑된 치즈버거",
        "Smoke Shack           ": "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거",
        "Shroom Burger         ": "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거",
        "Cheese burger         ": "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거",
        "Hamburger             ": "비프패티를 기반으로 야채가 들어간 기본버거",
        "Kimchi                ": "매움. 개매움",
        "Beer1                 ": "밀크",
        "Beer2                 ": "초코",
        "Coca-Cola             ": "코카콜라",
        "Sprite                ": "맛있다",
        "Orange Juice          ": "맛있으면",
        "Coca-Cola zero        ": "또 먹지",
        "Sprite zero           ": "또 먹으면 배탈나",
        "Nilla Nilla Vanilla   ": "밀크",
        "Cho.choc Chocolate    ": "초코",
        "Ni Ur Ghul Banana     ": "니 얼굴 반하나",
        "No Zam                ": "재미없다",
        "You Mom Alien?        ": "엄마는 외계인 있나요?"
    ]       // 모든 메뉴:설명을 담은 딕셔너리
}                  // 각 아이템의 이름(배열), 가격(dic), 설명(dic)으로 기입




class MainMenu: Menu {
    let data = CategoryData()
    
    
    override func choiceDisplay() {
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        
        """)            // 환영 문구
        
        for (index, menuType) in data.listOfMainMenu.enumerated() {
            let intro = data.introOfMainMenu[menuType]
            print("\(index+1). \(menuType)| \(intro!)")
        }   // 메뉴이름(배열), 메뉴정보(딕셔너리)를 for문으로 출력
        
        print("""
        👇🏻원하는 번호를 입력해주세요.
        """)     // 종료 뒤로가기 등
    }   // 화면에 선택지를 보여주는 메서드
    
    override func commandInput() {
        
        // 사용자 입력을 data.listOfMainMenu 배열에서 찾아 selectedMenu에 초기화
        if let userInput = Int(readLine()!), userInput >= 1 && userInput <= data.listOfMainMenu.count {
            let index = userInput - 1
            let selectedMenu = data.listOfMainMenu[index]
            
            // selectedMenu와 사용자 입력이 같다면, 각 메뉴로 화면 변경
            switch selectedMenu {
            case "Burgers         ":controller.changeMenu(changeTo: BurgerMenu())
            case "Frozen Custard  ":controller.changeMenu(changeTo: FrozenCustardMenu())
            case "Drinks          ":controller.changeMenu(changeTo: DrinkMenu())
            case "Beer            ":controller.changeMenu(changeTo: BeerMenu())
            case "ShoppingCart    ":controller.changeMenu(changeTo: CardSlash(cart: shoppingCart))
// 문제점 :index로 받고 있어서 index를 벗어난 선택지는 부여할 수 없음 부여하려면 array에 상품처럼 "종료"를 넣어줘야 함.

            default:
                print("없는 메뉴입니다. 메인화면으로 돌아갑니다.")
                controller.changeMenu(changeTo: MainMenu())
            }
        } else {
            print("잘못된 입력입니다.")
            controller.changeMenu(changeTo: MainMenu())
        }
    }    // 사용자의 입력을 받는 메서드
}            // 키오스크의 진입화면.


class BurgerMenu: Menu {
    let data = ItemData()
    
    override func choiceDisplay() {
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        
        """)            // 환영 문구
        
        // 메뉴이름(배열), 메뉴정보(딕셔너리)를 for문으로 출력
        for (index, menuType) in data.burgerNameList.enumerated() {
            let price = data.priceOfMenu[menuType]
            let intro = data.introOfMenu[menuType]
            print("\(index+1). \(menuType)| ₩\(price!) | \(intro!)")
        }
        
        print("""
        👇🏻원하는 번호를 입력해주세요.
        """)     // 종료 뒤로가기 등
    }
    
    override func commandInput() {
        
        // userInput을 ItemData에서 찾아서 cart.selectedMenu에 초기화해주는 구문
        if let userInput = Int(readLine()!), userInput >= 1 && userInput <= data.burgerNameList.count {
            let index = userInput - 1
            let selectedMenu = data.burgerNameList[index]
            shoppingCart.selectedItem = selectedMenu
            
            switch selectedMenu {
            case "\(selectedMenu)":controller.changeMenu(changeTo: CartYesOrNo())
                
            default:
                print("없는 메뉴입니다. 메인화면으로 돌아갑니다.")
                controller.changeMenu(changeTo: MainMenu())
            }
            
        } else {
            print("잘못된 입력입니다. 메인화면으로 돌아갑니다.")
            controller.changeMenu(changeTo: MainMenu())
        }
    }
}          // 버거메뉴

class FrozenCustardMenu: Menu {
    let data = ItemData()
    
    override func choiceDisplay() {
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        
        """)            // 환영 문구
        
        // 메뉴이름(배열), 메뉴정보(딕셔너리)를 for문으로 출력
        for (index, menuType) in data.frozenCustardNameList.enumerated() {
            let price = data.priceOfMenu[menuType]
            let intro = data.introOfMenu[menuType]
            print("\(index+1). \(menuType)| ₩\(price!) | \(intro!)")
        }
        
        print("""
        👇🏻원하는 번호를 입력해주세요.
        """)     // 종료 뒤로가기 등
    }
    
    override func commandInput() {
        
        if let userInput = Int(readLine()!), userInput >= 1 && userInput <= data.frozenCustardNameList.count {
            let index = userInput - 1
            let selectedMenu = data.frozenCustardNameList[index]
            shoppingCart.selectedItem = selectedMenu
            
            switch selectedMenu {
            case "\(selectedMenu)":controller.changeMenu(changeTo: CartYesOrNo())
                
            default:
                print("없는 메뉴입니다. 메인화면으로 돌아갑니다.")
                controller.changeMenu(changeTo: MainMenu())
            }
            
        } else {
            print("잘못된 입력입니다. 메인화면으로 돌아갑니다.")
            controller.changeMenu(changeTo: MainMenu())
        }
    }
}   // 아이스크림 메뉴

class DrinkMenu: Menu {
    let data = ItemData()
    
    override func choiceDisplay() {
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        
        """)            // 환영 문구
        
        // 메뉴이름(배열), 메뉴정보(딕셔너리)를 for문으로 출력
        for (index, menuType) in data.drinkNameList.enumerated() {
            let price = data.priceOfMenu[menuType]
            let intro = data.introOfMenu[menuType]
            print("\(index+1). \(menuType)| ₩\(price!) | \(intro!)")
        }
        
        print("""
        👇🏻원하는 번호를 입력해주세요.
        """)     // 종료 뒤로가기 등
    }
    
    override func commandInput() {
        
        if let userInput = Int(readLine()!), userInput >= 1 && userInput <= data.drinkNameList.count {
            let index = userInput - 1
            let selectedMenu = data.drinkNameList[index]
            shoppingCart.selectedItem = selectedMenu
            
            switch selectedMenu {
            case "\(selectedMenu)":controller.changeMenu(changeTo: CartYesOrNo())
                
            default:
                print("없는 메뉴입니다. 메인화면으로 돌아갑니다.")
                controller.changeMenu(changeTo: MainMenu())
            }
            
        } else {
            print("잘못된 입력입니다. 메인화면으로 돌아갑니다.")
            controller.changeMenu(changeTo: MainMenu())
        }
    }
}           // 음료 메뉴

class BeerMenu: Menu {
    let data = ItemData()
    
    override func choiceDisplay() {
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        
        """)            // 환영 문구
        
        // 메뉴이름(배열), 메뉴정보(딕셔너리)를 for문으로 출력
        for (index, menuType) in data.beerNameList.enumerated() {
            let price = data.priceOfMenu[menuType]
            let intro = data.introOfMenu[menuType]
            print("\(index+1). \(menuType)| ₩\(price!) | \(intro!)")
        }
        
        print("""
        👇🏻원하는 번호를 입력해주세요.
        """)     // 종료 뒤로가기 등
    }
    
    override func commandInput() {
        
        if let userInput = Int(readLine()!), userInput >= 1 && userInput <= data.beerNameList.count {
            let index = userInput - 1
            let selectedMenu = data.beerNameList[index]
            shoppingCart.selectedItem = selectedMenu
            
            switch selectedMenu {
            case "\(selectedMenu)":controller.changeMenu(changeTo: CartYesOrNo())
                
            default:
                print("없는 메뉴입니다. 메인화면으로 돌아갑니다.")
                controller.changeMenu(changeTo: MainMenu())
            }
            
        } else {
            print("잘못된 입력입니다.")
            controller.changeMenu(changeTo: MainMenu())
        }
    }
}            // 맥주 메뉴

class CartYesOrNo : Menu {
    
    // 사용자 입력에 따라서 초기화 된 cart.selectedItem을 가져와서 이름은 shoppingCartList에, 가격은 cartItemPriceDic에 value로 저장
    let data = ItemData()
    var selectedItem = ""
    var shoppingCartList: [String] = []
    var cartItemPriceDic: [String: Double] = [:]
    
    // cart.cartItemPriceDic에 저장된 value들을 더해 totalPrice를 구하기
    func calculateSumOfPrice() {
        let prices = shoppingCart.cartItemPriceDic.values
        controller.totalPrice = prices.reduce(0, +)
    }
    
    override func choiceDisplay() {
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        
        """)            // 환영 문구
        
        print("""
        상품을 장바구니에 담으시겠습니까?
        선택한 상품 : \(shoppingCart.selectedItem)
        
        1. 장바구니 담기
        2. 나가기
        
        👇🏻원하는 번호를 입력해주세요.
        """)     // 종료 뒤로가기 등
    }
    
    override func commandInput() {
        
        
        let userInput = readLine()!
        switch userInput {
        case "1":
            if let price = data.priceOfMenu[shoppingCart.selectedItem] {
                shoppingCart.cartItemPriceDic[shoppingCart.selectedItem] = price
            } else {
                print("잘못된 입력입니다. 메인화면으로 돌아갑니다.")
                controller.changeMenu(changeTo: MainMenu())
            }
            shoppingCart.shoppingCartList.append(shoppingCart.selectedItem)
            calculateSumOfPrice()
            controller.changeMenu(changeTo: MainMenu())
        case "2":controller.changeMenu(changeTo: MainMenu())
            
        default:
            print("없는 메뉴입니다. 메인화면으로 돌아갑니다.")
            controller.changeMenu(changeTo: MainMenu())
        }
    }
}        // 선택한 상품을 카트에 넣을 것인지를 묻는 페이지


class CardSlash : Menu {
    var selectedItem = ""
    var shoppingCartList: [String] = []
    var cart: CartYesOrNo
    
    init(cart: CartYesOrNo) {
        self.cart = cart
    }
    
    override func choiceDisplay() {
        
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        
        """)            // 환영 문구
        
        print("""
        장바구니에 담긴 상품들을 결제하시겠습니까?
        
        장 바 구 니 : \(shoppingCart.shoppingCartList.first!)등 \(shoppingCart.shoppingCartList.count)개 상품
        결 제 금 액 : \(Int(controller.totalPrice*1000))원
        
        
        1. 결제하기
        2. 나가기
        
        👇🏻원하는 번호를 입력해주세요.
        """)     // 종료 뒤로가기 등
    }
    
    override func commandInput() {
        
        let userInput = readLine()!
        switch userInput {
        case "1":
            print("주문이 완료되었습니다. 잠시만 기다려주세요.")
            self.cart.cartItemPriceDic.removeAll()
            self.cart.shoppingCartList.removeAll()              //결제하기를 누르면, array와 dic을 초기화
            controller.changeMenu(changeTo: MainMenu())
        case "2":controller.changeMenu(changeTo: MainMenu())
            
        default:
            print("없는 메뉴입니다. 메인화면으로 돌아갑니다.")
        }
    }
}          // 결제 여부를 묻는 화면



class Controller {
    var finish = false              // 프로그램의 종료조건 false로 초기화
    var totalPrice:Double = 0.0
    var showPages:Menu = MainMenu()      // 각 페이지를 보여주는 변수 메인메뉴로 초기화
    func changeMenu(changeTo: Menu) {
        showPages = changeTo
    }
}                // 각 화면간 전환 및 totalPrice를 담고있는 클래스

//인스턴스 생성
var controller = Controller()
var shoppingCart = CartYesOrNo()

while controller.finish == false {
    controller.showPages.choiceDisplay()
    controller.showPages.commandInput()
}   // 프로그램의 실행/종료 여부 판단하는 구문이었으나, 종료되는 조건은 없음


// 문제점
// 모든 메뉴 선택지가 array에 들어가있고 그걸 for문으로 끄집어오다보니, 선택지 추가 및 삭제가 어렵다.
// 예를 들어 burgerNameList에 value가 5까지 있을 때, 9. 뒤로가기, 0. 종료 등 index의 순서를 벗어나는 선택지를 만들기가 번거롭다. 나중에 해봐야지..

