function solution(answers) {
    let results = [];

    let patterns = [
        [1, 2, 3, 4, 5],
        [2, 1, 2, 3, 2, 4, 2, 5],
        [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    ];
    let patternIndexes = [0, 0, 0];
    let answerCount = [0, 0, 0];

    for (let i = 0; i < answers.length; i++) {
        for (let j = 0; j < patterns.length; j++) {
            let pattern = patterns[j];
            if (answers[i] === pattern[patternIndexes[j]]) {
                answerCount[j]++;
            }
            if (pattern.length - 1 === patternIndexes[j]) {
                patternIndexes[j] = 0;
            } else {
                patternIndexes[j]++;
            }
        }
    }

    let bestAnswer = Math.max(...answerCount);
    for (let i = 0; i < answerCount.length; i++) {
        if (bestAnswer === answerCount[i]) {
            results.push(i + 1);
        }
    }

    return results;
}

//let answers = [1, 2, 3, 4, 5];
let answers = [1, 3, 2, 4, 2];
//let answers = [1, 3, 2, 4, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
console.log(solution(answers));