export function flush(superThis) {
    const {
        fullPath
    } = superThis.$route;
    superThis.$router.replace({
        path: '/redirect' + fullPath
    })
}

export function FormatterDate(date) {
    let created = new Date(date);
    return `${created.getFullYear()}-${created.getMonth()+1}-${created.getDate()}`;
}

//防抖
export const debounce = function (fn, wait = 1000) {
    console.info("xxx");
    console.info(fn);
    let timeout = null;
    return function () {
        clearTimeout(timeout);
        timeout = setTimeout(() => {
            fn.apply(this, arguments);
        }, wait);
    }
}

//节流
// export const throttle = (fn, delay) => {
//     let prev = Date.now();
//     return () => {
//         let now = Date.now();
//         if (now - prev > delay) {
//             fn();
//             prev = now;
//         }
//     }
// }

export const throttle = (fn, delay = 300) => {
    let canRun = true;
    return () => {
        if (!canRun) {
            return;
        }
        canRun = false;
        setTimeout(() => {
            fn.apply(this, arguments);
            canRun = true;
        }, delay);
    };
}