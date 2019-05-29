const solution = (inputGenres, inputPlays) => {
    let answer = [];
    let map = {};
    for (let i = 0; i < inputGenres.length; i++) {
        let genre = inputGenres[i];
        let play = inputPlays[i];
        let title = {index: i, plays: play};
        if (map[genre] === undefined) {
            map[genre] = {
                sum: play,
                mostPlays: [title, {plays: 0}]
            }
        } else {
            let genreObject = map[genre];
            genreObject.sum += play;
            if (genreObject.mostPlays[0].plays < play) {
                genreObject.mostPlays.unshift(title)
            } else if (genreObject.mostPlays[1].plays < play) {
                genreObject.mostPlays.splice(1, 0, title);
            }
        }
    }

    let genres = Object.values(map);
    genres.sort((a, b) => {return b.sum - a.sum});

    for (let i = 0; i < genres.length; i++) {
        let genre = genres[i];
        answer.push(genre.mostPlays[0].index);
        let secondTitleIndex = genre.mostPlays[1].index;
        if (secondTitleIndex !== undefined) answer.push(secondTitleIndex);
    }

    return answer;
};

let genres = ['classic', 'pop', 'classic', 'classic', 'pop', 'kPop'];
let plays = [500, 600, 150, 800, 2500, 3200];
let result = [5, 4, 1, 3, 0];

console.log(solution(genres, plays));