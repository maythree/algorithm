
import Foundation

class BigNumberSort : NSObject {
    public func printResult() -> String {
        var printValue : String
//        let numbers = [6, 10, 2] //6210
//        let numbers2 = [3, 30, 34, 5, 9] //9534330
//        let numbers3 = [40,403 ]//40403
//        let numbers4 = [40,405]//40540
//        let numbers5 = [40,404]//40440
//        let numbers6 = [12,121]//12121
//        let numbers7 = [2,22,223]//223222
//        let numbers8 = [21,212]//21221
//        let numbers9 = [41,415]//41541
//        let numbers10 = [2,22 ]//222
//        let numbers11 = [70,0,0,0]//70000
        let numbers = [0,0,0,0]//0000
//        let numbers13 = [0,0,0,1000]//1000000
//        let numbers14 = [12,1213]//121312
        
        
        printValue = solution(numbers)
        return String(printValue)
    }

    
    //답이 0000000일 경우에는 0으로 출력해야합니다

    func solution(_ numbers:[Int]) -> String {
        var numbersCopy = numbers
        numbersCopy.sort {
            var sortbool = false
            let firstNum : Int = Int(String($0) + String($1)) ?? 0
            let secondNum : Int = Int(String($1) + String($0)) ?? 0
            if firstNum  < secondNum {
                sortbool = false
            } else {
                sortbool = true
            }
            return sortbool
        }
        
        let sortNum = numbersCopy.map{String($0)}
        var value = sortNum.reduce(""){$0+$1}
        if Int(value) == 0 {
            value = "0"
        }
        return value
    }
    
    
//    func solution(_ numbers: [Int]) -> String {
//        let sortedNumbers = numbers.sorted {
//            Int("\($0)\($1)")! > Int("\($1)\($0)")!
//        }
//        let answer = sortedNumbers.map { String($0) }.reduce("") { $0 + $1 }
//        return sortedNumbers.first == 0 ? "0" : answer
//    }
}


//가장 큰 수
//문제 설명
//0 또는 양의 정수가 주어졌을 때, 정수를 이어 붙여 만들 수 있는 가장 큰 수를 알아내 주세요.
//
//예를 들어, 주어진 정수가 [6, 10, 2]라면 [6102, 6210, 1062, 1026, 2610, 2106]를 만들 수 있고, 이중 가장 큰 수는 6210입니다.
//
//0 또는 양의 정수가 담긴 배열 numbers가 매개변수로 주어질 때, 순서를 재배치하여 만들 수 있는 가장 큰 수를 문자열로 바꾸어 return 하도록 solution 함수를 작성해주세요.
//
//제한 사항
//numbers의 길이는 1 이상 100,000 이하입니다.
//numbers의 원소는 0 이상 1,000 이하입니다.
//정답이 너무 클 수 있으니 문자열로 바꾸어 return 합니다.
//입출력 예
//numbers    return
//    [6, 10, 2]    6210
//[3, 30, 34, 5, 9]    9534330
