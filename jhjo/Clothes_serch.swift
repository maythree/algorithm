
import Foundation
//위장옷 갯수 완전탐색
class Clothes : NSObject {
    
    public func printResult() -> String {
        var printValue : Int
//        let arrangement = [["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]
        let arrangement = [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]
        printValue = solution(arrangement)
        
        return String(printValue)
    }
    //1. 종류의 개수를 가져온다.
    //2. 종류의 개수로 반복문 실행
    //3. 종류의 개수로 올수있는 가지수를 카운트 한다.
    //4. 모든 가지수를 더한다.
    func solution(_ clothes:[[String]]) -> Int {
        let clothedKindArray = getKindArray(clothes)
        var count = 0
        for (index,_) in clothedKindArray.enumerated() {
            count += getDayCount(clothes, Array(Array()) ,index)
        }
        return count
    }
    
    
    func getKindArray(_ clothes:[[String]]) -> Array<String> {
        var kindArray : Set<String> = Set()
        for item in clothes{
            kindArray.insert(item[1])
        }
        return Array(kindArray)
    }
    
    func getDayCount(_ clothes:[[String]], _ clothedToday:[[String]], _ count:Int) -> Int {
        var clothedcount = 0
        if clothedToday.count == count+1 {
            //print(clothedToday)
            return 1
        }
        var copyClothedToday = clothedToday
        for item in clothes{
            if count == 0 {
                copyClothedToday = clothedToday
            }
            if checkCanClothed(clothedToday, item) {
                copyClothedToday.append(item)
                clothedcount += getDayCount(clothes, copyClothedToday, count)
            }
        }
        return clothedcount
    }
    
    //이미 입고 있는 종류인지 확인
    func checkCanClothed(_ clothedToday:[[String]], _ checkitem:[String]) -> Bool {
        var isClothed = true
        for item in clothedToday {
            if item[1] == checkitem[1] || item[0] == checkitem[0]{
                isClothed = false
                break
            }
        }
        return isClothed
    }
    
    
    
}

//위장
//문제 설명
//스파이들은 매일 다른 옷을 조합하여 입어 자신을 위장합니다.
//
//예를 들어 스파이가 가진 옷이 아래와 같고 오늘 스파이가 동그란 안경, 긴 코트, 파란색 티셔츠를 입었다면 다음날은 청바지를 추가로 입거나 동그란 안경 대신 검정 선글라스를 착용하거나 해야 합니다.
//
//종류    이름
//얼굴    동그란 안경, 검정 선글라스
//상의    파란색 티셔츠
//하의    청바지
//겉옷    긴 코트
//스파이가 가진 의상들이 담긴 2차원 배열 clothes가 주어질 때 서로 다른 옷의 조합의 수를 return 하도록 solution 함수를 작성해주세요.
//
//제한사항
//clothes의 각 행은 [의상의 이름, 의상의 종류]로 이루어져 있습니다.
//스파이가 가진 의상의 수는 1개 이상 30개 이하입니다.
//같은 이름을 가진 의상은 존재하지 않습니다.
//clothes의 모든 원소는 문자열로 이루어져 있습니다.
//모든 문자열의 길이는 1 이상 20 이하인 자연수이고 알파벳 소문자 또는 '_' 로만 이루어져 있습니다.
//스파이는 하루에 최소 한 개의 의상은 입습니다.
//입출력 예
//clothes    return
//    [[yellow_hat, headgear], [blue_sunglasses, eyewear], [green_turban, headgear]]    5
//[[crow_mask, face], [blue_sunglasses, face], [smoky_makeup, face]]    3
//입출력 예 설명
//예제 #1
//headgear에 해당하는 의상이 yellow_hat, green_turban이고 eyewear에 해당하는 의상이 blue_sunglasses이므로 아래와 같이 5개의 조합이 가능합니다.
//
//1. yellow_hat
//2. blue_sunglasses
//3. green_turban
//4. yellow_hat + blue_sunglasses
//5. green_turban + blue_sunglasses
//예제 #2
//face에 해당하는 의상이 crow_mask, blue_sunglasses, smoky_makeup이므로 아래와 같이 3개의 조합이 가능합니다.
//
//1. crow_mask
//2. blue_sunglasses
//3. smoky_makeup
