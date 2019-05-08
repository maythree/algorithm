
import Foundation

class Search_decimal : NSObject {
    
    public func printResult() -> String {
        
        let members = "173"
        let printValue = solution(members)
        return String(printValue.description)
    }
    
    public func solution(_ numbers:String) -> Int {
        let arraynumbers = Array(numbers).map { Int(String($0)) }
        let n = arraynumbers.count
        let r = arraynumbers.count
        let combArr : Array<Int> = Array()
        let count = rotationPrime(arraynumbers: arraynumbers as! Array<Int>,combArr: combArr, n: n, r: r)
        return count
    }
    
    public func rotationPrime(arraynumbers:Array<Int>, combArr:Array<Int>, n:Int, r:Int) -> Int {
        var primeCount = 0
        
        if combArr.count == r {
            //조합한 숫자가 소수인지 확인
            let value = combArr.map {String($0)}
            let stringRepresentation = value.joined(separator: "")
            print(stringRepresentation)
            if isPrime(value:  Int(stringRepresentation) ?? 0) {
                print("소수 :" + stringRepresentation)
                return 1
            }
            return 0
        }
        var combArrCopy = Array(combArr)
        for (_, item) in arraynumbers.enumerated() {
            if combArrCopy.contains(item) {
                continue
            }
            let arrayFilter = arraynumbers.filter { $0 != item }
            combArrCopy.append(item)
            primeCount = primeCount + rotationPrime(arraynumbers: arrayFilter, combArr: combArrCopy, n: n, r: r)
        }
        return primeCount
    }
    
    //소수 구하기
    public func isPrime(value:Int) -> Bool {
        var isPrime = true
        if value < 1 {
            return false
        }
        for index in 2..<value {
            if value / index == 0 {
                isPrime = false
                break
            }
        }
        return isPrime
    }
    
}

//문제 설명
//한자리 숫자가 적힌 종이 조각이 흩어져있습니다. 흩어진 종이 조각을 붙여 소수를 몇 개 만들 수 있는지 알아내려 합니다.
//
//각 종이 조각에 적힌 숫자가 적힌 문자열 numbers가 주어졌을 때, 종이 조각으로 만들 수 있는 소수가 몇 개인지 return 하도록 solution 함수를 완성해주세요.
//
//제한사항
//numbers는 길이 1 이상 7 이하인 문자열입니다.
//numbers는 0~9까지 숫자만으로 이루어져 있습니다.
//013은 0, 1, 3 숫자가 적힌 종이 조각이 흩어져있다는 의미입니다.
//입출력 예
//numbers    return
//17    3
//011    2
//입출력 예 설명
//예제 #1
//[1, 7]으로는 소수 [7, 17, 71]를 만들 수 있습니다.
//
//예제 #2
//[0, 1, 1]으로는 소수 [11, 101]를 만들 수 있습니다.
//
//11과 011은 같은 숫자로 취급합니다.
