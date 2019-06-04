const solution = (array, commands) => {
    let answer = [];
    for (let i = 0; i < commands.length; i++) {
        let command = commands[i];
        let slicedArray = array.slice(command[0] - 1, command[1]);
        let sortedArray = slicedArray.sort((a, b) => a - b);
        answer.push(sortedArray[command[2] - 1]);
    }

    return answer;
};

let array = [1, 5, 2, 6, 3, 7, 4];
let commands = [[2, 5, 3], [4, 4, 1], [1, 7, 3]];
let result = [5, 6, 3];

console.log(solution(array, commands));