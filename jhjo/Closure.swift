
import Foundation
//클로져 샘플
class Closure : NSObject {
    
    public func printResult() -> String {
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        func backwards(s1: String, s2: String) -> Bool {
            return s1 > s2
        }
        //기본형
        var reversed = names.sorted( by: { (left:String, right:String) -> Bool in return left > right } )
        print(reversed)
        
        //후행클로저
        var reversed1 = names.sorted() { (left:String, right:String) -> Bool in return left > right }
        print(reversed1)
        
        //소괄호 생략
        var reversed2 : [String] = names.sorted { (left:String, right:String) -> Bool in return left > right }
        print(reversed2)
        
        //단축인자
        var reversed3  : [String] = names.sorted { return $0 > $1 }
        print(reversed3)
        
        //암시적 반환
        var reversed4  : [String] = names.sorted { $0 > $1 }
        print(reversed4)
        
        return "11 "
    }
    
}

