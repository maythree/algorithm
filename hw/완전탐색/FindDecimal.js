function solution(numberString) {
    let answer = 0;
    let numbers = [];
    for (let i = 0; i < numberString.length; i++) {
        numbers.push(parseInt(numberString.substr(i, 1)));
    }
    let combinationNumbers = [];
    for (let i = 0; i < numbers.length; i++) {
        for (let j = 0; j < numbers.length; i++) {
            combinationNumbers.push()
        }
    }
    return answer;
}

let numberString = '17';
//let numberString = '011';
console.log(solution(numberString));