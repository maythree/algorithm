
import Foundation

class Stick : NSObject {
    
    public func printResult() -> String {
        var printValue : Int
        
        let arrangement = "()(((()())(())()))(())"
        printValue = solution(arrangement)
        
        return String(printValue)
    }
    
   public func solution(_ arrangement:String) -> Int {
        if arrangement.count > 100000 {
            return -1
        }
        
        let characters = Array(arrangement)
        //print(String(describing: type(of:characters)))
        let leftCount = countChar(itemArray:characters , item:"(")
        let rightCount = countChar(itemArray:characters , item:")")
        if leftCount != rightCount{
            return -2
        }
        
        let count = checkCount(itemArray : characters)
        
        
        
        
        return count
    }
    
    
    func checkCount(itemArray : Array<Character>) -> Int {
        var opencount = 0
        var totalcount = 0
        var isLaser = false
        for (index, item) in itemArray.enumerated() {
            let itemString = String(item)
            if itemString == "(" {
                let nextitem = String(itemArray[index+1])
                if nextitem == ")" {
                    isLaser = true
                    continue
                }
                opencount = opencount + 1
                
            } else if itemString == ")" {
                if isLaser {
                    isLaser = false
                    totalcount = totalcount + opencount
                    continue
                }
                totalcount = totalcount + 1
                opencount = opencount - 1
            }
        }
        return totalcount
    }
    
    func countChar(itemArray : Array<Character>, item : Character ) -> Int {
        var count = 0
        for char in itemArray {
            if char == item {
                count = count + 1
            }
        }
        return count
    }
    

}

