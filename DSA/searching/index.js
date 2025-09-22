const prompt = require("prompt-sync")();

// let array = [1, 2, 3, 9, 8, 7, 5, 6, 4];
let n= prompt("Enter an array: ");
let array = n.split(" ").map(n=>Number(n));
console.log(array);
let target = Number(prompt("Enter a number need to find: "));

function binarySearch(arr, target) {
    let left = 0;
    let right = arr.length-1;
    while (left <= right) {
        let mid = Math.floor((left + right) / 2);

        if (arr[mid] === target) {
            return mid;
        } else if (arr[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1;
}
// if (binarySearch(array, target) != -1) {
    console.log("Found value at index: ", binarySearch(array, target));
// }

