import Foundation

// 이건 나중에 불러오려고 따로 함수화 해놓은 친구들이에요
func showMainMenu_() {
    print("\n[ SHAKESHACK MENU ]")
    print("1. Burgers         | 앵거스 비프 통살을 다져만든 버거")
    print("2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림")
    print("3. Drinks          | 매장에서 직접 만드는 음료")
    print("4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주")
    print("0. 종료            | 프로그램 종료")
}

// 이건 나중에 불러오려고 따로 함수화 해놓은 친구들이에요
func showBurgersMenu_() {
    print("\n[ Burgers MENU ]")
    print("1. ShackBurger   | W 6.9 | 토마토, 양상추, 쉑소스가 토핑된 치즈버거")
    print("2. SmokeShack    | W 8.9 | 베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거")
    print("3. Shroom Burger | W 9.4 | 몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거")
    print("4. Cheeseburger  | W 6.9 | 포테이토 번과 비프패티, 치즈가 토핑된 치즈버거")
    print("5. Hamburger     | W 5.4 | 비프패티를 기반으로 야채가 들어간 기본버거")
    print("0. 뒤로가기      | 뒤로가기")
}

// 이걸 몸통처럼 쓰나봐요
func main_() {
    
    // readLine을 switch ~ case와 함께 쓰려고 하는데 잘 안되고 있는 중이네요
    print("아무거나 눌러봐")
    let userInput = readLine()
    userInput
    guard let userInput = readLine() else { return }
    let inputNumber = Int(userInput)
    switch inputNumber {
    case 1:
        print("하세요")
    case 2:
        print("뭔데")
    default:
        print("안녕")
    }

}

main_()
