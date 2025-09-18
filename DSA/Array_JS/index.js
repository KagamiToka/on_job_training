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

}

moveZeroToEnd(array);
moveZeroToStart(array);
