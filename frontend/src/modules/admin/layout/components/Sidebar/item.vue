<script>
export default {
  name: 'Item',
  functional:true,
  data(){
    return{

    }
  },
  methods:{

  },
  mounted(){

  },
  components: {

  },
  props:{
    icon:{
      type:String,
      default:'',
    },
    title:{
      type:String,
      default: '',
    }
  },
  render: function (h, context) {
    const {icon,title} = context.props;
    const vnodes = [];

    if(icon){
      vnodes.push(<svg-icon icon-class={icon}></svg-icon>);
    }
    if(title){
      vnodes.push(<span slot='title'>{(title)}</span>);
    }
    return vnodes;
  }
}
</script>
