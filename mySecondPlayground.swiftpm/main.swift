import Foundation

class Calculator {
    func calculate(_ operator: Character, _ firstNumber: Int, _ secondNumber: Int ) -> Double {
        switch `operator` {
        case "+" :
            return Double(firstNumber + secondNumber)
        case "-" :
            return Double(firstNumber - secondNumber)
        case "×" :
            return Double(firstNumber * secondNumber)
        case "÷" :
            return Double(firstNumber / secondNumber)
        case "%" :
            return Double(firstNumber % secondNumber)
        default:
            return 0
        }
        // 정확한 operator가 전달되지 않을 시 0을 리턴(nil을 리턴해도 됨)
    }
}

let calculator = Calculator()
let addResult = calculator.calculate("+", 5, 3)// 덧셈 연산
let subtractResult = calculator.calculate("-", 5, 3)// 뺄셈 연산
let multiplyResult = calculator.calculate("×", 5, 3)// 곱셈 연산
let divideResult = calculator.calculate("÷", 5, 3)// 나눗셈 연산
let remainderResult = calculator.calculate("%", 5, 3)//나머지 연산

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")
