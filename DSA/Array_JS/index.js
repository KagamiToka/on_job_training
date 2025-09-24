let array = [4,8,0,0,2,0,1,0];

const moveZeroToEnd = (array) => {
    let index = 0;
    //Solution 1
    // for (let i = 0; i < array.length; i++) {
    //     if (array[i] !== 0) {
    //         array[index] = array[i];
    //         index++;
    //     }
    // }
    // while (array[index] < array.length) {
    //     array[index++] = 0;
    // }

    //Solution 2
    for (let i = 0; i < array.length; i++) {
        if (array[i] !== 0) {
            let temp = array[i];
            array[i] = array[index];
            array[index++] = temp;
        }
    }
    
    console.log(array);
}

const moveZeroToStart = (array) => {
    let index = array.length - 1;
    //Solution 1
    // for (let i = array.length-1; i >= 0; i--) {
    //     if (array[i] !== 0) {
    //         array[index--] = array[i];
    //     }
    // }
    // while (array[index] >= 0) {
    //     array[index--] = 0;
    // }

    //Solution 2
    for (let i = array.length-1; i >= 0; i--) {
        if (array[i] !== 0) {
            let temp = array[i];
            array[i] = array[index];
            array[index--] = temp;
        }
    }
    console.log(array);
}

const goalSum = (array) => {
    let seen = new Set();
    for (let num of arr) {
        let complement = goalSum - num;
        if (seen.has(complement)) {
            console.log(`Found pair: (${num}, ${complement})`);
            return true;
        }
        seen.add(num);
    }
    return false;
}

const maxMultiplier = (arr) => {
    arr.sort((a, b) => a - b);
    let n = arr.length;
    return Math.max(arr[0] * arr[1], arr[n - 1] * arr[n - 2]);
}

console.log(maxMultiplier(array));
console.log(goalSum(array));
moveZeroToEnd(array);
moveZeroToStart(array);

