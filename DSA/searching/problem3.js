function searchInsert(arr, key) {
    let left = 0;
    let right = arr.length - 1;

    while (left <= right) {
        let mid = Math.floor((left + right) / 2);

        if (arr[mid] === key) {
            return mid;
        } else if (arr[mid] < key) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }

    return left;
}
console.log(searchInsert([1,2,3,4,5], 3));
console.log(searchInsert([1,2,3,5], 4));
