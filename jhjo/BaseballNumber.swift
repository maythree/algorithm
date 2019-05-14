
import Foundation

class BaseballNumber : NSObject {
    
    public func printResult() -> String {
        var printValue : Int
        
        let arrangement = [[123, 1, 1], [356, 1, 0], [327, 2, 0], [489, 0, 1]]
        printValue = solution(arrangement)
        
        return String(printValue)
    }
    
    //1. 전체 경우의 수를 가져온다.
    //2. 입력한 값과 일치히지 않는 경우는 삭제 한다.
        //일치비교
    //3. 남아있는 값의 카운트가 해당 답이다.
    func solution(_ baseball:[[Int]]) -> Int {
        let answerArr : Array<[Int]> = compare(baseball)
        return answerArr.count
    }
    
    //비교
    func compare(_ baseball:[[Int]]) -> Array<[Int]> {
        var answerSystem = search ()
        for item in baseball {
            for baseballItem in answerSystem {
                let number = item[0]
                let strike = item[1]
                let ball = item[2]
                if !filterBaseball(number: number, ball: ball, strike: strike, answer: baseballItem) {
                    answerSystem = answerSystem.filter { $0 != baseballItem }
                }
            }
        }
        return answerSystem
    }
    
    //해당 카운터 체크
    func filterBaseball(number:Int, ball:Int, strike:Int, answer:[Int]) -> Bool{
        var check = true
        let numberString = String(number)
        let arrayString = Array(numberString.map {$0})
        let numberArray = Array(arrayString.map { Int(String($0)) })
        
        var ballCount = 0
        var strikeCount = 0
        let answerFilter = answer
        for (index,item) in answerFilter.enumerated() {
            for (offset, number) in numberArray.enumerated() {
                if item == number {
                    if index == offset {
                        strikeCount += 1
                    } else {
                        ballCount += 1
                    }
                }
            }
        }
        
        if ball == ballCount && strike == strikeCount {
            //print(answer)
            check = true
        } else {
            check = false
        }
        return check
    }
    
    //전체 배열을 가저온다
    func search() -> Array<[Int]>{
        var array = Array<[Int]>()
        for a in 1...9 {
            for b in 1...9 {
                for c in 1...9 {
                    if a==b || b==c || a==c {
                        continue
                    }
                    array.append([a,b,c])
                }
            }
        }
        return array
    }
}

//문제 설명
//숫자 야구 게임이란 2명이 서로가 생각한 숫자를 맞추는 게임입니다. 게임해보기
//
//각자 서로 다른 1~9까지 3자리 임의의 숫자를 정한 뒤 서로에게 3자리의 숫자를 불러서 결과를 확인합니다. 그리고 그 결과를 토대로 상대가 정한 숫자를 예상한 뒤 맞힙니다.
//
//* 숫자는 맞지만, 위치가 틀렸을 때는 볼
//* 숫자와 위치가 모두 맞을 때는 스트라이크
//* 숫자와 위치가 모두 틀렸을 때는 아웃
//예를 들어, 아래의 경우가 있으면
//
//A : 123
//B : 1스트라이크 1볼.
//A : 356
//B : 1스트라이크 0볼.
//A : 327
//B : 2스트라이크 0볼.
//A : 489
//B : 0스트라이크 1볼.
//이때 가능한 답은 324와 328 두 가지입니다.
//
//질문한 세 자리의 수, 스트라이크의 수, 볼의 수를 담은 2차원 배열 baseball이 매개변수로 주어질 때, 가능한 답의 개수를 return 하도록 solution 함수를 작성해주세요.
//
//제한사항
//질문의 수는 1 이상 100 이하의 자연수입니다.
//baseball의 각 행은 [세 자리의 수, 스트라이크의 수, 볼의 수] 를 담고 있습니다.
//입출력 예
//baseball    return
//    [[123, 1, 1], [356, 1, 0], [327, 2, 0], [489, 0, 1]]    2
//입출력 예 설명
//문제에 나온 예와 같습니다.

