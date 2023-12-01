import Foundation

class Calculator {
        /*
        프로퍼티 초기화
        */
    func calculate(_ operator: Character, _ firstNumber: Int, _ secondNumber: Int ) -> Double {
        /*
        operator에 따라 프로퍼티의 함수를 실행
        */
        
        switch `operator` {
        case "+" :
            return AddOperation.operate(firstNumber, secondNumber)
        case "-" :
            return SubtractOperation.operate(firstNumber, secondNumber)
        case "×" :
            return MultiplyOperation.operate(firstNumber, secondNumber)
        case "÷" :
            return DivideOperation.operate(firstNumber, secondNumber)
        default:
            return 0
        }
    }
}

class AddOperation {
    static func operate(_ firstNumber: Int, _ secondNumber: Int ) -> Double {
        return Double(firstNumber + secondNumber)
    }
}


class SubtractOperation {
    static func operate(_ firstNumber: Int, _ secondNumber: Int ) -> Double {
        return Double(firstNumber - secondNumber)
    }
}


class MultiplyOperation {
    static func operate(_ firstNumber: Int, _ secondNumber: Int ) -> Double {
        return Double(firstNumber * secondNumber)
    }
}


class DivideOperation {
    static func operate(_ firstNumber: Int, _ secondNumber: Int ) -> Double {
        return Double(firstNumber / secondNumber)
    }
}


let calculator = Calculator()
    // 프로퍼티 초기화
let addResult = calculator.calculate("+", 5, 3)
let subtractResult = calculator.calculate("-", 5, 3)
let multiplyResult = calculator.calculate("×", 5, 3)
let divideResult = calculator.calculate("÷", 5, 3)

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
