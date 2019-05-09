function solution(answers) {

    var p1 = [1,2,3,4,5];

    var p2 = [2,1,2,3,2,4,2,5];

    var p3 = [3,3,1,1,2,2,4,4,5,5];

    var s1 = 0;

    var s2 = 0;

    var s3 = 0;

    var i = 0;

    for (i = 0; i < answers.length; i++){

        if (answers[i] == p1[i%5]){s1++};

        if (answers[i] == p2[i%8]){s2++};

        if (answers[i] == p3[i%10]){s3++};

    }

    var result = [];

    var max = Math.max.apply(null, [s1, s2, s3]);

    if(s1 == max){result.push(1)};

    if(s2 == max){result.push(2)};

    if(s3 == max){result.push(3)};

    return result;
}