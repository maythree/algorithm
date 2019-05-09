
import Foundation

class SearchDecimalNumber : NSObject {
    
    public func printResult() -> String {
        let members = "011"
        let printValue = solution(members)
        return String(printValue.description)
    }
 
    var decimalSet : Set<Int> = Set()
    public func solution(_ numbers:String) -> Int {
        let arraynumbers = Array(numbers).map { Int(String($0)) }
        let r = arraynumbers.count
        let rArray = Array(1...r)
        var count = 0
        //경의의수 조합의 수 에대한 루프
        for index in rArray.reversed() {
            count += permutation(a: arraynumbers as! [Int], n: r, r: index, depth: 0)
        }
        return decimalSet.count
    }
    
    //소수 구하기
    public func isPrime(value:Int) -> Bool {
        var isPrime = true
        if value < 1 {
            return false
        }
        if value == 1 {
            return false
        }
        for index in 2..<value {
            if value % index == 0 {
                isPrime = false
                break
            }
        }
        return isPrime
    }
    
    //순열 
    //https://twpower.github.io/62-permutation-by-recursion
    func permutation(a: [Int], n: Int, r: Int, depth:Int) -> Int{
        var count = 0
        if r == depth {
            //print(a)
            let printvalue = Array(a[0..<r])
            let valueString = printvalue.map {String($0)}
            let stringRepresentation = valueString.joined(separator: "")
            if isPrime(value:  Int(stringRepresentation) ?? 0) {
                //print("소수 => "+stringRepresentation)
                //중복 제거
                decimalSet.insert(Int(stringRepresentation) ?? 0)
                return 1
            } else {
                //print("소수아님 => "+stringRepresentation)
                return 0
            }
        } else {
            var copya = a
            for i in depth..<n {
                copya.swapAt(i, depth)
                count += permutation(a: copya, n: n,r: r,depth: depth+1)
                copya.swapAt(i, depth)
            }
        }
        return count
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
