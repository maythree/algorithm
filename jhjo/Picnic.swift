
import Foundation
//피크닉
class Picnic : NSObject {
    
    public func printResult() -> String {
        var printValue : String
        let text = """
        3
        2 1
        0 1
        4 6
        0 1 1 2 2 3 3 0 0 2 1 3
        6 10
        0 1 0 2 1 2 1 3 1 4 2 3 2 4 3 4 3 5 4 5
    """
        printValue = solution(text)
        return printValue
    }
    
    public func solution(_ text:String) -> String {
        let arrayInput = text.split(separator: "\n")
        let firstLine = Int(String(arrayInput.first ?? "-1").trimmingCharacters(in: [" "]))
        
        var returnValue : String = ""
        
        for index in 0..<firstLine! {
            let memberCount = String(arrayInput[index*2+1]).trimmingCharacters(in: [" "])
            let friendDetail = String(arrayInput[index*2+2]).trimmingCharacters(in: [" "])
            let count = countMember(first: String(memberCount), secound: String(friendDetail))
            returnValue = returnValue + "\n" + count
        }
        
        return returnValue
    }
    
    //짝 구하기
    func countMember(first:String, secound:String) -> String {
        
        var count = 0
        
        let memberCountArray = first.split(separator: " ")
        let friendShipArray = secound.split(separator: " ")
        let partnerNumer = friendShipArray.map( {Int($0)} )
        let membaerCount = Int(memberCountArray[0])
        let membaerCountArray = Array(0..<membaerCount!)
        //print(String("Start =========="))
        count += countDetailMember(membaerCountArray: membaerCountArray, partnerNumer: partnerNumer as! Array<Int>, count: 0)
        return String(count)
    }
    
    func countDetailMember(membaerCountArray:Array<Int>, partnerNumer:Array<Int>, count:Int) -> Int {
        var totalCount = 0
        if membaerCountArray.count == 0 {
            //찾았을 경우
            return 1
        }
        if membaerCountArray.count == 1 {
            //조합이 되지 않을 경우
            return 0
        }
        
        let findMinNumber = membaerCountArray.min()
        for (index, item) in partnerNumer.enumerated() {
            if item == findMinNumber {
                if index % 2 == 0 {
                    let partnerNum = partnerNumer[index + 1]
                    //print(String("findMinNumber = \(findMinNumber) partnerNum = \(partnerNum) membaerCountArray = \(membaerCountArray)"))
                    if partnerNum > findMinNumber! {
                        let waitMemverArraycopy = membaerCountArray.filter { $0 != findMinNumber }.filter { $0 != partnerNum }
                        totalCount += countDetailMember(membaerCountArray: waitMemverArraycopy, partnerNumer: partnerNumer, count: count+1)
                    }
                } else {
                    let partnerNum = partnerNumer[index - 1]
                    //print(String("findMinNumber = \(findMinNumber) partnerNum = \(partnerNum) membaerCountArray = \(membaerCountArray)"))
                    if partnerNum > findMinNumber! {
                        let waitMemverArraycopy = membaerCountArray.filter { $0 != findMinNumber }.filter { $0 != partnerNum }
                        totalCount += countDetailMember(membaerCountArray: waitMemverArraycopy, partnerNumer: partnerNumer, count: count+1)
                    }
                }
            }
        }
        
        return totalCount
    }
}

