const coverType = [
    [[0, 0], [1, 0], [0, 1]],
    [[0, 0], [0, 1], [1, 1]],
    [[0, 0], [1, 0], [1, 1]],
    [[0, 0], [1, 0], [1, -1]]
];

const setLocation = (board, y, x, type, delta) => {
    let isOk = true;
    for (let i = 0; i < 3; i++) {
        const ny = y + coverType[type][i][0];
        const nx = x + coverType[type][i][1];
        if (ny < 0 || ny >= board.length || nx < 0 || nx >= board[0].length) {
            isOk = false;
        } else if ((board[ny][nx] += delta) > 1) {
            isOk = false;
        }
    }
    return isOk;
}

const cover = (board) => {
    let y = -1, x = -1;
    for (let i = 0; i < board.length; i++) {
        for (let j = 0; j < board[i].length; j++) {
            if (board[i][j] === 0) {
                y = i;
                x = j;
                break;
            }
        }
        if (y != -1) break;
    }
    
    if (y == -1) return 1;
    let ret = 0;
    for (let type = 0; type < 4; type++) {
        if (setLocation(board, y, x, type, 1)) {
            ret += cover(board);
        }
        setLocation(board, y, x, type, -1);
    }
    return ret;
}

// let board = [
//     [1, 0, 0, 0, 0, 0, 1],
//     [1, 0, 0, 0, 0, 0, 1],
//     [1, 1, 0, 0, 1, 1, 1]
// ];
let board = [
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
];
let result = cover(board);
console.log(result);