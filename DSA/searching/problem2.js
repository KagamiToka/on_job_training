const prompt = require("prompt-sync")();

let arr =  [1, 2, 3, 3, 3, 4, 4, 5];
let n = Number(prompt("Enter number: "));

function findFirstAndLast(arr, key) {
    function firstOccurrence(arr, key) {
        let left = 0, right = arr.length - 1, result = -1;
        while (left <= right) {
            let mid = Math.floor((left + right) / 2);
            if (arr[mid] === key) {
                result = mid;
                right = mid - 1; // tiếp tục tìm bên trái
            } else if (arr[mid] < key) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return result;
    }

    function lastOccurrence(arr, key) {
        let left = 0, right = arr.length - 1, result = -1;
        while (left <= right) {
            let mid = Math.floor((left + right) / 2);
            if (arr[mid] === key) {
                result = mid;
                left = mid + 1;
            } else if (arr[mid] < key) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return result;
    }

    return [firstOccurrence(arr, key), lastOccurrence(arr, key)];
}

console.log(findFirstAndLast(arr, n));
