const createQueue = (maxSize = 100) => {
    let queue = new Array(maxSize);
    let front = 0;
    let rear = -1;
    let count = 0;

    return {
        size: function () {
            return count;
        },

        isEmpty: function () {
            return count === 0;
        },

        frontValue: function () {
            return this.isEmpty() ? null : queue[front];
        },

        backValue: function () {
            return this.isEmpty() ? null : queue[rear];
        },

        push: function (element) {
            if (count === maxSize) {
                console.log("Queue overflow");
                return;
            }
            rear++;
            queue[rear] = element;
            count++;
        },

        pop: function () {
            if (this.isEmpty()) {
                console.log("Queue underflow");
                return null;
            }
            let val = queue[front];
            front++;
            count--;
            return val;
        },

        queueArray: function () {
            let result = "";
            for (let i = front; i <= rear; i++) {
                result += queue[i] + (i < rear ? ", " : "");
            }
            return result;
        }
    };
}

let q = createQueue(10);
console.log(q.isEmpty());
q.push(5);
q.push(10);
q.push(15);
console.log(q.queueArray());
console.log(q.frontValue());
console.log(q.backValue());
q.pop();
console.log(q.queueArray());
console.log(q.size());
