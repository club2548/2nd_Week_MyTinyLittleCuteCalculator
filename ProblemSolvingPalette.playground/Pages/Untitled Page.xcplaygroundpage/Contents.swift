import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var ans: [[Int]] = []
    
    for i in 0..<arr1.count {
        var tmp: [Int] = []
        
        for j in 0..<arr1[i].count {
            tmp.append(arr1[i][j] + arr2[i][j])
        }
        ans.append(tmp)
    }
    
    return ans
}
let arr1 = [[1,2],[2,3]]
let arr2 = [[3,4],[5,6]]
var result1 = solution(arr1, arr2)

print(result1)
