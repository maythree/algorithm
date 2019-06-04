const solution = (numbers) => {
    numbers.sort((a, b) => {
        return (b + '' + a) - (a + '' + b);
    });

    return numbers[0] === 0 ? '0' : numbers.join('');
};

//let numbers = [6, 10, 2]; // 6210
//let numbers = [3, 30, 34, 5, 9]; //	9534330
let numbers = [0, 0]; // 0

console.log(solution(numbers));