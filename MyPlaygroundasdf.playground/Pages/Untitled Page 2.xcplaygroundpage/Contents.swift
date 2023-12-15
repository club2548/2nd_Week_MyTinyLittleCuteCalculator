import Foundation

func showMainMenu() {
    print("\n[ SHAKESHACK MENU ]")
    print("1. Burgers         | 앵거스 비프 통살을 다져만든 버거")
    print("2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림")
    print("3. Drinks          | 매장에서 직접 만드는 음료")
    print("4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주")
    print("0. 종료            | 프로그램 종료")
}

func showBurgersMenu() {
    print("\n[ Burgers MENU ]")
    print("1. ShackBurger   | W 6.9 | 토마토, 양상추, 쉑소스가 토핑된 치즈버거")
    print("2. SmokeShack    | W 8.9 | 베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거")
    print("3. Shroom Burger | W 9.4 | 몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거")
    print("4. Cheeseburger  | W 6.9 | 포테이토 번과 비프패티, 치즈가 토핑된 치즈버거")
    print("5. Hamburger     | W 5.4 | 비프패티를 기반으로 야채가 들어간 기본버거")
    print("0. 뒤로가기      | 뒤로가기")
}

func main() {
    var isProgramRunning = true

    while isProgramRunning {
        showMainMenu()

        print("메뉴를 선택하세요: ", terminator: "")
        if let input = readLine(), let menuNumber = Int(input) {
            switch menuNumber {
            case 1:
                showBurgersMenu()
                // Burgers 메뉴에 대한 추가 로직을 여기에 작성
            case 2:
                print("Frozen Custard 메뉴를 선택하였습니다.")
                // Frozen Custard 메뉴에 대한 추가 로직을 여기에 작성
            case 3:
                print("Drinks 메뉴를 선택하였습니다.")
                // Drinks 메뉴에 대한 추가 로직을 여기에 작성
            case 4:
                print("Beer 메뉴를 선택하였습니다.")
                // Beer 메뉴에 대한 추가 로직을 여기에 작성
            case 0:
                print("프로그램을 종료합니다.")
                isProgramRunning = false
            default:
                print("잘못된 입력입니다. 다시 시도하세요.")
            }
        } else {
            print("잘못된 입력입니다. 다시 시도하세요.")
        }
    }
}

main()
