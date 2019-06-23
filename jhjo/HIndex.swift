
import Foundation

class HIndex : NSObject {
    
    public func printResult() -> String {
        var printValue : Int

        let citations = [3, 0, 6, 1, 5] //3
        let citations1 =  [6, 6, 6, 6, 6, 6] //6
        let citations2 =  [2, 2, 2]      //2
        let citations3 = [51, 22, 20, 14, 10, 4, 3] //5

        
        printValue = solution(citations)
        print(String(printValue))
        
        printValue = solution(citations1)
        print(String(printValue))
        printValue = solution(citations2)
        print(String(printValue))
        printValue = solution(citations3)
        print(String(printValue))
        
        
        
        return String(String(printValue))
    }
    
    public func solution(_ citations:[Int]) -> Int {
        var hindex = 0
        let sortdata = citations.sorted{$0 > $1}
        for index in sortdata {
            if index > hindex {
                hindex = hindex + 1
            } else {
                break
            }
        }
        return hindex
    }
    
}

//문제 설명
//H-Index는 과학자의 생산성과 영향력을 나타내는 지표입니다. 어느 과학자의 H-Index를 나타내는 값인 h를 구하려고 합니다. 위키백과1에 따르면, H-Index는 다음과 같이 구합니다.
//
//어떤 과학자가 발표한 논문 n편 중, h번 이상 인용된 논문이 h편 이상이고 나머지 논문이 h번 이하 인용되었다면 h가 이 과학자의 H-Index입니다.
//
//어떤 과학자가 발표한 논문의 인용 횟수를 담은 배열 citations가 매개변수로 주어질 때, 이 과학자의 H-Index를 return 하도록 solution 함수를 작성해주세요.
//
//제한사항
//과학자가 발표한 논문의 수는 1편 이상 1,000편 이하입니다.
//논문별 인용 횟수는 0회 이상 10,000회 이하입니다.
//입출력 예
//citations    return
//    [3, 0, 6, 1, 5]    3
//입출력 예 설명
//이 과학자가 발표한 논문의 수는 5편이고, 그중 3편의 논문은 3회 이상 인용되었습니다. 그리고 나머지 2편의 논문은 3회 이하 인용되었기 때문에 이 과학자의 H-Index는 3입니다.
//
//※ 공지 - 2019년 2월 28일 테스트케이스가 추가되었습니다.


//http://libguides.snu.ac.kr/c.php?g=319123&p=2131850
//H-INDEX 계산
//연구자의 발표 논문을 피인용수가 많은 순으로 정렬한 순위. 순위와 피인용수가 같아지거나 혹은 순위가 피인용수보다 작은 최대값이 h-index입니다.
//
//[51, 22, 20, 14, 10, 4, 3] //5
//
//위의 예시와 같이 순위보다 피인용수가 낮아지는 6순위의 바로 위의 5순위가 h-index 됨.
//
//즉, h-index가 5이며, 그 저자가 발표한 논문 중 5개의 논문이 적어도 각각 5번 인용되었다.
