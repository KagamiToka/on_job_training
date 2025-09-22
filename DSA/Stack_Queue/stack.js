const createStack = (maxSize = 100) => {
    let stack = new Array(maxSize);
    let current = -1;

    return {
        size: function () {
            return current + 1;
        },

        isEmpty: function () {
            return current === -1;
        },

        topValue: function () {
            if (current === -1) {
                return null;
            }
            return stack[current]
        },

        push: function (element) {
            if (current === maxSize - 1) {
                console.log("Stack overflow");
                return;
            }
            return stack[++current] = element;
        },

        pop: function () {
            if (current === -1) {
                console.log("Stack underflow");
                return;
            }
            return stack[current--];
        },

        stackArray: function () {
            let result = "";
          for (let i = 0; i <= current; i++) {
              result += stack[i] + (i < current ? ", " : "");
          }
          return result;
        }
    };
}

//Test
let st = createStack(10);
console.log(st.isEmpty());
st.push(2);
st.push(3);
st.push(4);
console.log(st.stackArray());
console.log(st.topValue());
console.log(st.size());
st.pop();
console.log(st.topValue());
console.log(st.stackArray());