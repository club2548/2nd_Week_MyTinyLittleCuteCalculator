import Foundation

import Foundation

func solution(_ n:Int) -> Int {
    var strThree = String(n, radix: 3)
    var arrReversedThree = strThree.reversed()
    var strReversedThree = ""
    
    for i in arrReversedThree {
        strReversedThree += String(i)
    }
    return Int(strReversedThree, radix: 3)!
}
print(solution(45))
