/**
 * 갈색 격자의 수 brown 은 8 이상 5,000 이하인 자연수입니다.
 * 빨간색 격자의 수 red 는 1 이상 2,000,000 이하인 자연수입니다.
 * 카펫의 가로 길이는 세로 길이와 같거나, 세로 길이보다 깁니다.
 */

function solution(brown, red) {
    if (brown < 8 || brown > 5000) return false;
    if (red < 1 || red > 2000000) return false;
    let area = brown + red;
    let height = parseInt(Math.sqrt(area));
    for (let i = height; i > 0; i--) {
        let width = parseInt(area / i);
        if (width * i === area && ((width - 2) * (i - 2)) === red) {
            return [width, i];
        }
    }
}

//let brown = 10, red = 2; //[4, 3]
//let brown = 8, red = 1; //[3, 3]
//let brown = 24, red = 24; //[8, 6]
//let brown = 16, red = 5; // [7, 3]
let brown = 5000, red = 2497; // [119, 63], [2499, 3]

console.log(solution(brown, red));

console.log(1);