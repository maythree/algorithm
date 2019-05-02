/**
 * 갈색 격자의 수 brown 은 8 이상 5,000 이하인 자연수입니다.
 * 빨간색 격자의 수 red 는 1 이상 2,000,000 이하인 자연수입니다.
 * 카펫의 가로 길이는 세로 길이와 같거나, 세로 길이보다 깁니다.
 */

function solution(brown, red) {
    let answer = [];
    let horizontal, vertical;
    let area = brown + red;
    let initBrownWidth = Math.round(Math.sqrt(area));
    console.log(initBrownWidth);
    let initRedWith = initBrownWidth - 2;

    //for (let i = 0; i < Math.)

    return answer;
}

//let brown = 10, red = 2; //[4, 3]
//let brown = 8, red = 1; //[3, 3]
let brown = 24, red = 24; //[8, 6]

console.log(solution(brown, red));