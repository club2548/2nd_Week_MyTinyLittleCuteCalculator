import Foundation



var listOfMainMenu: Array<String> = [
    "Burgers         ",
    "Frozen Custard  ",
    "Drinks          ",
    "Beer            "
]               // 메인 메뉴를 담은 배열
var introOfMainMenu: Dictionary<String, String> = [
    "Burgers         ": "앵거스 비프 통살을 다져만든 버거",
    "Frozen Custard  ": "매장에서 신선하게 만드는 아이스크림",
    "Drinks          ": "매장에서 직접 만드는 음료",
    "Beer            ": "뉴욕 브루클린 브루어리에서 양조한 맥주"
] // 메뉴:설명을 담은 딕셔너리

var listOfBurger: Array<String> = [
    "Shack Burger ",
    "Smoke Shack  ",
    "Shroom Burger",
    "Cheese burger",
    "Hamburger    "
]                 // 버거 메뉴를 담은 배열
var priceOfMenu: Dictionary<String, Double> = [
    "Shack Burger ": 8.9,
    "Smoke Shack  ": 8.9,
    "Shroom Burger": 9.4,
    "Cheese burger": 6.9,
    "Hamburger    ": 5.4,
    "Kimchi       ": 8.0
]     // 메뉴:가격을 담은 딕셔너리
var introOfMenu: Dictionary<String, String> = [
    "Shack Burger ": "토마토, 양상추, 쉑소스가 토핑된 치즈버거",
    "Smoke Shack  ": "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거",
    "Shroom Burger": "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거",
    "Cheese burger": "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거",
    "Hamburger    ": "비프패티를 기반으로 야채가 들어간 기본버거",
    "Kimchi       ": "매움. 개매움"
]     // 메뉴:설명을 담은 딕셔너리

var selectedItemList: [String: Double] = [:]




class MainMenu {

    var goToBurgerMenu = BurgerMenu()
    var goToFrozenCustardMenu = FrozenCustardMenu()
    var goToDrinkMenu = DrinkMenu()
    var goToBeerMenu = BeerMenu()
    var goToShoppingCart = ShoppingCart()
    
    func upperside() {
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        아래 메뉴를 최소 3번은 읽고, 고민한 후에 번호를 신중하게 입력하세요.
        
        """)
    }
    
    func choiceDisplay() {
        for (index, menuType) in listOfMainMenu.enumerated() {
            let intro = introOfMainMenu[menuType]
            print("\(index+1). \(menuType)| \(intro!)")
        }
        print(" ")
        print("9. Cart            | 보자보자 뭘 골랐는지 보자")
        print("0. 종료             | 프로그램 종료\n\n")
        
        // 유저에게 입력을 요청하고
        print("장바구니 금액 : $00")
        print("햄버거를 우리 가게에서 사먹을 수 있는 기회를 줄게. 근데, 잘못 누르면 끝이야. 메뉴 골라봐.")
        print("👇🏻골라, 몇 번이야.")
    }
    
    func userInput() {
        // readLine()은 Optional String을 return하기 때문에 if let으로
        if let userInput = readLine(), let firstMenuNumber = Int(userInput) {
            switch firstMenuNumber {
            case 1:
                print("""
                버거가 먹고싶었구나?
                  
                """)
                goToBurgerMenu.justDoWhatISay()
                goToBurgerMenu.choiceDisplay()
                goToBurgerMenu.userInput()
                
            case 2:
                print("""
                아이스가 먹고싶었구나?
                  
                """)
                goToFrozenCustardMenu.justDoWhatISay()
                goToFrozenCustardMenu.choiceDisplay()
                goToFrozenCustardMenu.userInput()
            case 3:
                print("""
                음료가 먹고싶었구나?
                  
                """)
                goToDrinkMenu.justDoWhatISay()
                goToDrinkMenu.choiceDisplay()
                goToDrinkMenu.userInput()
            case 4:
                print("""
                맥주가 먹고싶었구나?
                  
                """)
                goToBeerMenu.justDoWhatISay()
                goToBeerMenu.choiceDisplay()
                goToBeerMenu.userInput()
            case 9:
                print("""
                다했어? 카트로 갈까?
                  
                """)
                goToShoppingCart.justDoWhatISay()
                goToShoppingCart.choiceDisplay()
                goToShoppingCart.userInput()
            case 0:
                print("안돼. 앞으로만 가.")
            default:
                print("뭐라는거야. 다시.")
                start.upperside()
                start.choiceDisplay()
                start.userInput()
            }
        } else {
            print("뭐라는거야. 다시.")
            start.upperside()
            start.choiceDisplay()
            start.userInput()
        }
    }
    // 이렇게 적용하고 싶다. 일단 나중에
    //    var inputValue = 10
    //    for i in 1...10 {
    //        switch inputValue {
    //        case i:
    //            print("""
    //                    버거가 먹고싶었구나?
    //
    //                    """)
    //
    //
    //        default:
    //            print("뭐라고? 돌아가.")
    //        }
    //    }
}                   //초기화면

class BurgerMenu {

    var thatsItForAll = ThatsItForAll()
    var thisIsShoppingCart = ShoppingCart()
    
    
    func justDoWhatISay() {
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        아래 메뉴를 최소 3번은 읽고, 고민한 후에 번호를 신중하게 입력하세요.
        
        """)
    }
    
    func choiceDisplay() {
        for (index, burgerName) in listOfBurger.enumerated() {
            let price = priceOfMenu[burgerName]
            let intro = introOfMenu[burgerName]
            print("\(index+1). \(burgerName)    | W \(price!) | \(intro!)")
        }
        print("0. 뒤로가기           | 뒤로가기\n\n")
        
        print("장바구니 금액 : $00")
        print("햄버거를 우리 가게에서 사먹을 수 있는 기회를 줄게. 근데, 잘못 누르면 끝이야. 메뉴 골라봐.")
        print("👇🏻골라, 몇 번이야.")
    }
    
    func userInput() {
        // readLine()은 Optional String을 return하기 때문에 if let으로
        if let userInput = readLine(), let firstMenuNumber = Int(userInput) {
            switch firstMenuNumber {
            case 1:
                print("""
                Shack Burger를 선택했습니다.
                """)
                selectedItem = listOfBurger[0]
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 2:
                print("""
                Smoke Shack?
                  
                """)
                selectedItem = listOfBurger[1]
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 3:
                print("""
                Shroom Burger?
                  
                """)
                selectedItem = listOfBurger[2]
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 4:
                print("""
                Cheese burger?
                  
                """)
                selectedItem = listOfBurger[3]
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 5 :
                print("""
                Hamburger?
                  
                """)
                selectedItem = listOfBurger[4]
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 0:
                print("안돼. 앞으로만 가.")
            default:
                print("뭐라는거야. 다시.")
                start.upperside()
                start.choiceDisplay()
                start.userInput()
            }
            
        } else {
            print("뭐라는거야. 다시.")
            start.upperside()
            start.choiceDisplay()
            start.userInput()
        }
    }
}              //버거메뉴화면
class FrozenCustardMenu {
    
    var thatsItForAll = ThatsItForAll()
    var thisIsShoppingCart = ShoppingCart()
    
    func justDoWhatISay() {
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        아래 메뉴를 최소 3번은 읽고, 고민한 후에 번호를 신중하게 입력하세요.
        
        """)
    }
    
    func choiceDisplay() {
        print("\n[ Frozen Custard MENU ]")
        print("1. Nilla Nilla Vanilla   | W 6.9 | 밀크")
        print("2. Cho.choc Chocolate    | W 8.9 | 초코")
        print("3. Ni Ur Ghul Banana     | W 9.4 | 니얼굴 반하나")
        print("4. No Zam                | W 6.9 | 재미없다")
        print("5. You Mom Alien?        | W 5.4 | 엄마는 외계인 있나요?")
        print("0. 뒤로가기      | 뒤로가기")
    }
    
    func userInput() {
        // readLine()은 Optional String을 return하기 때문에 if let으로
        if let userInput = readLine(), let firstMenuNumber = Int(userInput) {
            switch firstMenuNumber {
            case 1:
                print("""
                Nilla Nilla Vanilla
                """)
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 2:
                print("""
                Cho.choc Chocolate
                """)
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 3:
                print("""
                Ni Ur Ghul Banana
                """)
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 4:
                print("""
                No Zam
                """)
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 5:
                print("""
                You Mom Alien?
                """)
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 0:
                print("안돼. 앞으로만 가.")
            default:
                print("뭐라는거야. 다시.")
                start.upperside()
                start.choiceDisplay()
                start.userInput()
            }
        } else {
            print("뭐라는거야. 다시.")
            start.upperside()
            start.choiceDisplay()
            start.userInput()
        }
    }
}       //아이스크림화면
class DrinkMenu {
    
    var thatsItForAll = ThatsItForAll()
    var thisIsShoppingCart = ShoppingCart()
    
    func justDoWhatISay() {
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        아래 메뉴를 최소 3번은 읽고, 고민한 후에 번호를 신중하게 입력하세요.
        
        """)
    }
    
    func choiceDisplay() {
        print("\n[ Frozen Custard MENU ]")
        print("1. Coca-Cola           | W 6.9 | 코카콜라")
        print("2. Sprite              | W 8.9 | 맛있다")
        print("3. Orange Juice        | W 9.4 | 맛있으면")
        print("4. Coca-Cola zero      | W 6.9 | 또 먹지")
        print("5. Sprite zero         | W 5.4 | 엄마?")
        print("0. 뒤로가기      | 뒤로가기")
    }
    
    func userInput() {
        // readLine()은 Optional String을 return하기 때문에 if let으로
        if let userInput = readLine(), let firstMenuNumber = Int(userInput) {
            switch firstMenuNumber {
            case 1:
                print("""
                버거가 먹고싶었구나?
                """)
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 2:
                print("""
                아이스가 먹고싶었구나?
                """)
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 3:
                print("""
                음료가 먹고싶었구나?
                """)
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 4:
                print("""
                맥주가 먹고싶었구나?
                """)
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 5:
                print("""
                다했어? 카트로 갈까?
                """)
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 0:
                print("안돼. 앞으로만 가.")
            default:
                print("뭐라는거야. 다시.")
                start.upperside()
                start.choiceDisplay()
                start.userInput()
            }
        } else {
            print("뭐라는거야. 다시.")
            start.upperside()
            start.choiceDisplay()
            start.userInput()
        }
    }
}               //음료
class BeerMenu {
    
    var thatsItForAll = ThatsItForAll()
    var thisIsShoppingCart = ShoppingCart()
    
    func justDoWhatISay() {
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        아래 메뉴를 최소 3번은 읽고, 고민한 후에 번호를 신중하게 입력하세요.
        
        """)
    }
    
    func choiceDisplay() {
        print("\n[ Frozen Custard MENU ]")
        print("1. Beer1       | W 6.9 | 밀크")
        print("2. Beer2       | W 8.9 | 초코")
        print("0. 뒤로가기      | 뒤로가기")
    }
    
    func userInput() {
        // readLine()은 Optional String을 return하기 때문에 if let으로
        if let userInput = readLine(), let firstMenuNumber = Int(userInput) {
            switch firstMenuNumber {
            case 1:
                print("""
                버거가 먹고싶었구나?
                """)
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 2:
                print("""
                아이스가 먹고싶었구나?
                """)
                thatsItForAll.justDoWhatISay()
                thatsItForAll.choiceDisplay()
                thatsItForAll.userInput()
            case 0:
                print("안돼. 앞으로만 가.")
            default:
                print("뭐라는거야. 다시.")
                start.upperside()
                start.choiceDisplay()
                start.userInput()
            }
        } else {
            print("뭐라는거야. 다시.")
            start.upperside()
            start.choiceDisplay()
            start.userInput()
        }
    }
}                //맥주


class ThatsItForAll {
    var priceOfSelectedItem: Double = 0

    
    func justDoWhatISay() {
        print("""
            --------------------------------------------------------
            SHAKESHACK에 온 것을 환영합니다.
            아래 메뉴를 최소 3번은 읽고, 고민한 후에 번호를 신중하게 입력하세요.
            
            """)
    }
    
    func choiceDisplay() {
        print("""
        \(selectedItem)을 골랐네?
        1. 장바구니에 넣을거야?.
        2. 아니야?
        """)
    }
    
    func userInput() {
        //다시 입력받아 인벤토리냐, 처음부터 추가냐
        if let userInput = readLine(), let userChoice = Int(userInput){
            switch userChoice {
            case 1:
                print("카트에 넣었어")
                selectedItemList.updateValue(priceOfSelectedItem, forKey: selectedItem)
                start.upperside()
                start.choiceDisplay()
                start.userInput()
            case 2:
                print("다시 고민해봐")
                start.upperside()
                start.choiceDisplay()
                start.userInput()
            default:
                print("왜 이러는거야. 다시")
                start.upperside()
                start.choiceDisplay()
                start.userInput()
            }
            
        } else {
            print("뭐라는거야. 다시.")
            start.upperside()
            start.choiceDisplay()
            start.userInput()
        }
    }
}           // 카트에 넣을 것인지, 넣지 않을 것인지?
class ShoppingCart {
    var priceYouHaveToPay: Double = selectedItemList.values.reduce(0, +)

    func justDoWhatISay() {
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        아래 메뉴를 최소 3번은 읽고, 고민한 후에 번호를 신중하게 입력하세요.
        
        """)
    }
    
    func choiceDisplay() {
        print("""
        너가 고른건 \(selectedItemList) 등 \(selectedItemList.count)개를 골랐어.
        가격은 총 \(priceYouHaveToPay)야.
        
        1. 계산 할거야?
        2. 말거야?
        """)
    }
    
    func userInput() {
        if let userInput = readLine(), let firstMenuNumber = Int(userInput) {
            switch firstMenuNumber {
            case 1:
                print("""
                좀만 앉아서 기달려 바쁘니까.
                
                """)
                // while이 false가 되게 해주고 정상적으로 종료시켜야 겠습니다.
            case 2:
                print("""
                그래, 잘 생각했다.
                
                """)
            default:
                print("세 번 읽으라고 했지.")
            }
            
        } else {print("세 번 읽으라고 했지.")    }
    }
}            // 결제로 넘어갈 것인지, 초기화면으로 돌아갈 것인지?

var selectedItem: String = ""
var start = MainMenu()

//while true {
start.upperside()
start.choiceDisplay()
start.userInput()
//}

// Class와 Structure의 사용용도를 구분하자면, 값/참조 형태 때문에 상황마다 다르지만,
// OOP인 Swift에서는 대부분 참조 타입인 Class를 사용하는데
// 다루는 자료의 양이 적고, 상속이 필요하지 않다면, 값 타입인 Structure를 사용해도 좋다.
// 뒤로가기 같은 것들은 함수 내 파라미터를 활용해봐라!
