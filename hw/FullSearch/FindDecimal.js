function solution(numbers) {
    let numbersArr = [];
    let decimalCount = 0;
    let decimalMap = {};
    let permute;

    for (let i = 0; i < numbers.length; i++) {
        numbersArr.push(parseInt(numbers.substr(i, 1)));
    }

    const checkDecimal = (number) => {
        if (number === 0 || number === 1) return false;
        let isDecimal = true;
        for (let i = 2; i < number; i++) {
            if (number % i === 0) {
                isDecimal = false;
            }
        }
        return isDecimal;
    };

    permute = (parent, others) => { // 재귀로 현재 depth 만 책임진다. 인자로 고정 숫자와 고정숫자를 제외한 숫자들을 받는다
        for (let i = 0; i < others.length; i++ ){
            let newArr = others.concat([]);
            let spliceNumber = newArr.splice(i, 1);
            let fixNumbers = parent.concat(spliceNumber);
            let number = parseInt(fixNumbers.join(''));
            let hasDecimalMap = decimalMap[number];
            if (hasDecimalMap === undefined) {
                let isDecimal = checkDecimal(number);
                if (isDecimal) decimalCount++;
                decimalMap[number] = isDecimal;
            }
            permute(fixNumbers, newArr);
        }
    };

    permute([], numbersArr);

    return decimalCount;
}

//let numbers = '17';
//let numbers = '011'; // 0, 01, 011, 1, 10, 11, 101, 1, 10, 101
//let numbers = '123'; // 1, 12, 123, 13, 132, 2, 21, 213, 23, 231, 3, 32, 321, 31, 312
//let numbers = '1234';
//let numbers = '12345';
let numbers = '123456';
console.log(solution(numbers));