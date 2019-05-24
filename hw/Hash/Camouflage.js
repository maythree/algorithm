function solution(clothes) {
    let clothMap = {};
    let organizedClothes = [];
    let combinationCount = 1;
    let kindsCount = 0;

    const organize = () => {
        for (let i = 0 ; i < clothes.length; i++) {
            let cloth = clothes[i];
            let kinds = cloth[1];
            let name = cloth[0];
            if (!clothMap[kinds]) {
                clothMap[kinds] = [];
                kindsCount++;
            }
            clothMap[kinds].push(name);
        }

        for (let key in clothMap) {
            organizedClothes.push(clothMap[key]);
        }
    };

    const calc = () => {
        for (let i = 0; i < organizedClothes.length; i++) {
            combinationCount *= (organizedClothes[i].length + 1);
        }
        combinationCount += - 1;
    };

    organize();
    calc();

    return combinationCount;
}

// let clothes = [['yellow_hat', 'headgear'], ['blue_sunglasses', 'eyewear'], ['green_turban', 'headgear']]; // 5
// let clothes = [['crow_mask', 'face'], ['blue_sunglasses', 'face'], ['smoky_makeup', 'face']] // 3
let clothes = [
    ['crow_mask', 'face'], ['blue_sunglasses', 'face'], ['smoky_makeup', 'face'],
    ['yellow_hat', 'headgear'], ['green_turban', 'headgear'], ['blue_sunglasses', 'eyewear']
]; // 6 + (3 * 2 * 1)

console.log(solution(clothes));