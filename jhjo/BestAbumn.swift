
import Foundation

class BestAbumn : NSObject {
    
    public func printResult() -> String {
        var printValue : [Int]
        
        //        let arrangement1 = ["classic", "pop", "classic", "classic", "pop"]
        //        let arrangement2 = [500, 600, 150, 800, 2500]
        //[4, 1, 3, 0]
        
        let arrangement1 = ["classic", "pop","classic","pop","classic","classic"]
        let arrangement2 = [400,600,150,2500,500,500]
        //[3, 1, 4, 5]
        
        printValue = solution(arrangement1, arrangement2)
        return String(printValue.description)
    }
    
    //1. for 문을 돌며 카운터가 가장 높은 장르를 검색하면서 장르, 플레이 횟수, 앨범 번호, 총플레이수 를 인덱싱(플레이 회수가 가장 높은 2개) 한다.
    //2. 카운터가 가장 높은 장르 2개를 의 인덱싱 정보를 가져온다.
    //3. 가장 많이 플레이된 2개의 장르 결과를 가저온다.
    
    func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
        var values : [(String, [Int], [Int], Int)] = [] //장르, 플레이 횟수, 앨범 번호, 총플레이수
        for (index, genre) in genres.enumerated() {
            let playcount = plays[index]
            
            //해당 장르가 있는지 확인
            var ishave = false
            
            for (valuesindex, item) in values.enumerated() {
                var item = item
                if item.0 == genre {
                    //해당 아이템이 존재
                    ishave = true
                    
                    //총카운트 증가
                    item.3 = item.3 + playcount
                    
                    if (item.1.count == 1) {
                        if playcount > item.1[0] {
                            item.1.insert(playcount, at: 0)
                            item.2.insert(index, at: 0)
                        } else {
                            item.1.append(playcount)
                            item.2.append(index)
                        }
                    } else {
                        for (countIndex, count) in item.1.enumerated() {
                            if playcount > count {
                                item.1.insert(playcount, at: countIndex)
                                item.2.insert(index, at: countIndex)
                                break
                            }
                        }
                    }
                    values[valuesindex ?? 0] = (item.0,item.1,item.2,item.3)
                    break
                }
                
            }
            if !ishave {
                values.append((genre, [playcount], [index], playcount))
            }
        }
        
        //결과값 가져오기
        let result = values.sorted(by:{ $0.3 > $1.3 })
        var returnResult : [Int] = []
        for resultitem in result {
            for (resultitem2Index, resultitem2) in resultitem.2.enumerated() {
                //최대 2개 까지
                if resultitem2Index == 2 {
                    break;
                }
                returnResult.append(resultitem2)
            }
            
        }
        return returnResult
    }
    
    
}

//베스트앨범
//문제 설명
//스트리밍 사이트에서 장르 별로 가장 많이 재생된 노래를 두 개씩 모아 베스트 앨범을 출시하려 합니다. 노래는 고유 번호로 구분하며, 노래를 수록하는 기준은 다음과 같습니다.
//
//속한 노래가 많이 재생된 장르를 먼저 수록합니다.
//장르 내에서 많이 재생된 노래를 먼저 수록합니다.
//장르 내에서 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록합니다.
//노래의 장르를 나타내는 문자열 배열 genres와 노래별 재생 횟수를 나타내는 정수 배열 plays가 주어질 때, 베스트 앨범에 들어갈 노래의 고유 번호를 순서대로 return 하도록 solution 함수를 완성하세요.
//
//제한사항
//genres[i]는 고유번호가 i인 노래의 장르입니다.
//plays[i]는 고유번호가 i인 노래가 재생된 횟수입니다.
//genres와 plays의 길이는 같으며, 이는 1 이상 10,000 이하입니다.
//장르 종류는 100개 미만입니다.
//장르에 속한 곡이 하나라면, 하나의 곡만 선택합니다.
//모든 장르는 재생된 횟수가 다릅니다.
//입출력 예
//genres    plays    return
//    [classic, pop, classic, classic, pop]    [500, 600, 150, 800, 2500]    [4, 1, 3, 0]
//입출력 예 설명
//classic 장르는 1,450회 재생되었으며, classic 노래는 다음과 같습니다.
//
//고유 번호 3: 800회 재생
//고유 번호 0: 500회 재생
//고유 번호 2: 150회 재생
//pop 장르는 3,100회 재생되었으며, pop 노래는 다음과 같습니다.
//
//고유 번호 4: 2,500회 재생
//고유 번호 1: 600회 재생
//따라서 pop 장르의 [4, 1]번 노래를 먼저, classic 장르의 [3, 0]번 노래를 그다음에 수록합니다.
//
//※ 공지 - 2019년 2월 28일 테스트케이스가 추가되었습니다.
