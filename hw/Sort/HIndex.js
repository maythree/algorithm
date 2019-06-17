const solution = (citations) => {
    let hIndex = 0;
    citations.sort((a, b) => a - b);
    for (let i = 0; i < citations.length; i++) {
        let citationCount = 0;
        for (let j = 0; j < citations.length; j++) {
            let citation = citations[j];
            if (citation > i) {
                citationCount++;
            }
            if (citationCount >= i) {
                hIndex = citationCount;
            }
        }
    }

    return hIndex;
};

let citations = [3, 0, 6, 1, 5];
console.log(solution(citations));