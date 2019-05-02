(() => {
    let firstInput = [6, 10];
    let secondInput = [
        [0, 1], [0, 2], 
        [1, 2], [1, 3], [1, 4], 
        [2, 3], [2, 4], 
        [3, 4], [3, 5], 
        [4, 5]
    ];
    
    let numbers = [];
    let isFriend = Array(firstInput[0]).fill(null).map(() => Array());
    let isTaken = [];
    
    for (let i = 0; i < firstInput[0]; i++) {
        numbers.push(i);
    }
    
    for (let i = 0; i < secondInput.length; i++) {
        isFriend[secondInput[i][0]][secondInput[i][1]] = true;
    }
  
    let getPairCount = (isTaken) => {
        let firstFreeNumber = -1;
        for (let i = 0; i < numbers.length; i++) {
            if (!isTaken[i]) {
                firstFreeNumber = i;
                break;
            }
        }
        
        if (firstFreeNumber == -1) return 1;
        
        let ret = 0;
        
        for (let i = firstFreeNumber + 1; i < numbers.length; i++) {
            if (!isTaken[i] && isFriend[firstFreeNumber][i]) {
                isTaken[firstFreeNumber] = isTaken[i] = true;
                ret += getPairCount(isTaken);
                isTaken[firstFreeNumber] = isTaken[i] = false;
            }
        }
        return ret;
    };
    
    let count = getPairCount(isTaken);
    
    console.log(count);
})();



