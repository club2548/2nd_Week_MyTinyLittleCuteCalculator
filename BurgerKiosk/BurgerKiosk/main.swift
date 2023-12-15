import Foundation

class CategoryData {
    
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
}       // 각 카테고리(버거, 아이스크림 등)의 이름(배열)과 설명(dic)으로 기입


class MainMenu {
    let data = CategoryData()
    
    
    func choiceDisplay() {
        print("""
        --------------------------------------------------------
        SHAKESHACK에 온 것을 환영합니다.
        
        """)            // 환영 문구
        
        // 메뉴이름(배열), 메뉴정보(딕셔너리)를 for문으로 출력
        for (index, menuType) in data.listOfMainMenu.enumerated() {
            let intro = data.introOfMainMenu[menuType]
            print("\(index+1). \(menuType)| \(intro!)")
        }
        
        print("""
        9. Cart            | 보자보자 뭘 골랐는지 보자
        0. 종료             | 프로그램 종료
        👇🏻원하는 메뉴를 선택해주세요.
        """)     // 종료 뒤로가기 등
    }
    
    func commandInput() {
        //        // readLine()은 Optional String을 return하기 때문에 if let으로
        //        if let userInput = readLine(), let firstMenuNumber = Int(userInput) {
        //            switch firstMenuNumber {
        //            case 1:
        //                print("""
        //
        //                """)
        //            case 2:
        //                print("""
        //
        //                """)
        //            case 3:
        //                print("""
        //
        //                """)
        //            case 4:
        //                print("""
        //                """)
        //            case 9:
        //                print("""
        //
        //                """)
        //            case 0:
        //                print("뒤로가기")
        //            default:
        //                print("잘못된 입력입니다.")     // Int인데, case 중에는 없는 것
        //            }
        //        } else {
        //            print("잘못된 입력입니다.")         // Int도 아닌 것
        //        }
        //    }

        
        if let userInput = Int(readLine()!) {
            
            for i in data.listOfMainMenu {
                let categoryData = CategoryData()
                let matchNumber = categoryData.listOfMainMenu.startIndex + 1
                
                switch userInput {
                case matchNumber :
                    categoryData.listOfMainMenu.startIndex
                    print("""
                    \(categoryData.listOfMainMenu.startIndex)번을 선택했습니다.
                    """)
                    
                    
                default:
                    print("뭐라고? 돌아가.")
                }
            }
        } else { print ("잘못된 입력입니다.") }
    }                   //초기화면
}


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
}           // 각 아이템의 이름(배열), 가격(dic), 설명(dic)으로 기입
