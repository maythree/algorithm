function solution(baseball) {
    const checkStrike = (strike, callNumber, number) => {
        let matchedCount = 0;
        for (let i = 0; i < 3; i++) {
            if (number.charAt(i) === callNumber.charAt(i)) matchedCount++;
        }
        return matchedCount === strike;
    };

    const checkBall = (ball, callNumber, number) => {
        let matchedCount = 0;
        for (let i = 0; i < 3; i++) {
            let matchedIndex = number.indexOf(callNumber.charAt(i));
            if (matchedIndex > -1 && matchedIndex !== i) matchedCount++;
        }
        return matchedCount == ball;
    };

    let candidate = [];
    const initCandidate = () => {
        for (let i = 1; i <= 9; i++) {
            let firstLevelString = i + '';
            for (let j = 1; j <= 9; j++) {
                if (i === j) continue;
                let secondLevelString = firstLevelString + j;
                for (let k = 1; k <= 9; k++) {
                    if (i === j || i === k || j === k) continue;
                    let thirdLevelString = secondLevelString + k;
                    if (thirdLevelString.length === 3) candidate.push(thirdLevelString);
                }
            }
        }
    };
    initCandidate();

    for (let i = 0; i < baseball.length; i++) {
        let innerCandidate = [];
        let callUnit = baseball[i];
        for (let j = 0; j < candidate.length; j++) {
            let number = candidate[j];
            let callNumber = callUnit[0] + '';
            let strike = callUnit[1];
            let ball = callUnit[2];
            let result = checkStrike(strike, callNumber, number) && checkBall(ball, callNumber, number);
            if (result) innerCandidate.push(number);
        }
        candidate = innerCandidate;
    }

    return candidate.length;
}

let input = [[123, 1, 1], [356, 1, 0], [327, 2, 0], [489, 0, 1]];

console.log(solution(input));