<template>
</template>

<script>
export default {
    created(){
        const { params,query } = this.$route
        console.log("----");
        console.log(params,query);
        const { path } = params;
        console.log(path);
        this.$router.replace({
            path:'/'+path,
            query
        });
    },
    // mounted(){
    //     const { params,query } = this.$route
    //     console.log("----");
    //     console.log(params,query);
    //     const { path } = params;
    //     console.log(path);
    //     this.$router.replace({
    //         path:'/'+path,
    //         query
    //     });
    // },
    render: function(h){
        return h();
    }
}
</script>