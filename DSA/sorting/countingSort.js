function countingSort(arr, maxVal) {
    let count = new Array(maxVal + 1).fill(0);
    let output = [];

    for (let num of arr) count[num]++;

    for (let i = 0; i < count.length; i++) {
        while (count[i] > 0) {
            output.push(i);
            count[i]--;
        }
    }
    return output;
}

console.log("Counting Sort:", countingSort([4, 2, 2, 8, 3, 3, 1], 8));
