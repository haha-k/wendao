export function flush(superThis) {
    const {
        fullPath
    } = superThis.$route;
    console.log(fullPath)
    superThis.$router.replace({
        path: '/redirect' + fullPath
    })
}
