//1:加载模块 express pool
const express = require("express");
const pool = require("./pool");
//2:创建express对象
var app = express();
//2.1:加载跨域访问组件
const cors = require("cors");
//2.2:配置允许脚手架访问程序
app.use(cors({
    origin:["http://127.0.0.1:5000",
    "http://localhost:5000"],
    credentials:true
}));

//7.1 加载第三方模块 express-session
const session=require("express-session")
//7.2 对模块配置
app.use(session({
  secret:"128位随机字符",     //安全字符串
  resave:false,             //请求保存
  saveUninitialized:true,    //初始化保存
  cookie:{
    maxAge:1000 * 60 * 60 * 24  // session 存活的时间
  }
}))

//3:指定监听端口3333
app.listen(3333);
//4:指定静态目录 public
// __dirname 当前程序所属目录绝对路径 
//app.js vue_app_server
app.use(express.static(__dirname+"/public"))


//功能一:首页轮播图
app.get("/imagelist",(req,res)=>{
   var obj = [
     {id:1,img_url:"http://127.0.0.1:3333/img/swipe/swipe-1.jpg"},
     {id:2,img_url:"http://127.0.0.1:3333/img/swipe/swipe-2.jpg"},
     {id:3,img_url:"http://127.0.0.1:3333/img/swipe/swipe-3.jpg"}
   ];
   res.send(obj);
});

//功能二:新闻分页显示
app.get("/newslist",(req,res)=>{
 //1:获取参数
 var pno = req.query.pno;
 var pageSize = req.query.pageSize;
 //2:设置默认值 1 7
 if(!pno){pno = 1}
 if(!pageSize){pageSize=7}
 //3:创建正则表达式验证用户输入验证
 var reg = /^[0-9]{1,3}$/;
 //4:如果错出停止函数运行
 if(!reg.test(pno)){
    res.send({code:-1,msg:"页编格式不正确"});
    return;
 }
 if(!reg.test(pageSize)){
    res.send({code:-2,msg:"页大小格式不正确"});
    return;
 }

 var progress = 0;
 var obj = {code:1};
 //5:创建sql1 查询总记录数   严格区分大小写
 var sql = "SELECT count(id) AS c FROM ip_news";
 pool.query(sql,(err,result)=>{
   if(err)throw err;
   var pageCount = Math.ceil(result[0].c/pageSize);
   progress+=50;
   obj.pageCount = pageCount;
   if(progress==100){
     res.send(obj);
   }
 });
 //6:创建sql2 查询当前页内容 严格区分大小写
 var sql =" SELECT id,title,ctime,img_url,";
     sql+=" point,content";
     sql+=" FROM ip_news";
     sql+=" LIMIT ?,?";
 var offset = parseInt((pno-1)*pageSize);
    pageSize=parseInt(pageSize);
 pool.query(sql,[offset,pageSize],(err,result)=>{
   if(err)throw err;
   progress+=50;
   obj.data=result;
   if(progress==100){
     res.send(obj);
   }
 })
 //7:返回结果
});  



//功能三:查找一条新闻详细信息
app.get("/newsinfo",(req,res)=>{
  //1:参数 id 
  var id = req.query.id;
  var sql = " SELECT id,title,content,";
      sql +=" point,ctime";
      sql +=" FROM ip_news WHERE id = ?";
  //3:json {code:1,data:[{}]}
  pool.query(sql,[id],(err,result)=>{
      if(err)throw err;
      res.send({code:1,data:result});
  });
});


//功能四:分页查找指定新闻下评论列表
app.get("/getcomment",(req,res)=>{
//1:获取参数
var pno = req.query.pno;  //页码
var pageSize = req.query.pageSize;//页大小
var nid = req.query.nid; //新闻id
//2:设置默认值 1 7
if(!pno){pno = 1}
if(!pageSize){pageSize=7}
//3:创建正则表达式验证用户输入验证
var reg = /^[0-9]{1,3}$/;
//4:如果错出停止函数运行
if(!reg.test(pno)){
   res.send({code:-1,msg:"页编格式不正确"});
   return;
}
if(!reg.test(pageSize)){
   res.send({code:-2,msg:"页大小格式不正确"});
   return;
}

var progress = 0;
var obj = {code:1};

//session 保存 用户名  评论 代替 匿名
obj.uname=req.session.uanme;
// console.log(obj.uname);
//5:创建sql1 查询总记录数   严格区分大小写
var sql = "SELECT count(id) AS c FROM ip_comment WHERE nid = ?";
nid = parseInt(nid);
pool.query(sql,[nid],(err,result)=>{
  if(err)throw err;
  var pageCount = Math.ceil(result[0].c/pageSize);
  progress+=50;
  obj.pageCount = pageCount;
  if(progress==100){
    res.send(obj);
  }
});
//6:创建sql2 查询当前页内容 严格区分大小写
var sql =" SELECT id,user_name,ctime,";
    sql+=" content";
    sql+=" FROM ip_comment";
    sql+=" WHERE nid = ?";
    sql+=" ORDER BY id DESC";
    sql+=" LIMIT ?,?";
var offset = parseInt((pno-1)*pageSize);
    pageSize = parseInt(pageSize);
pool.query(sql,[nid,offset,pageSize],(err,result)=>{
  if(err)throw err;
  progress+=50;
  obj.data=result;
  if(progress==100){
    res.send(obj);
  }
})
});
//功能五:发表评论
//引入第三方模块:bodyParser 处理post请求
const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({
  extended:false
}));
app.post("/addComment",(req,res)=>{
  //1:获取3个参数
  //需要第三方模块支持 bodyParser
  var nid = req.body.nid;
  var content = req.body.content;
  var user_name = req.session.uname;
  // 东哥的  脚手架


  console.log(nid+":"+content+":"+user_name);
  //2:创建sql语句
  var sql  =" INSERT INTO `ip_comment`(`id`,";
      sql +=" `nid`, `user_name`, `ctime`,";
      sql +=" `content`) VALUES";
      sql +=" (null,?,?,now(),?)";
  nid = parseInt(nid);
  pool.query(sql,[nid,user_name,content],(err,result)=>{
       if(err)throw err;
       res.send({code:1,msg:"评论发表成功"});
  });
  //3:返回添加结果
})

 
//功能六:查询商品列表
app.get("/goodsList",(req,res)=>{
  var obj = [];
  obj.push({id:1,title:"iphoneXS",old:10222,now:8888,img_url:"http://127.0.0.1:3333/img/shop/shop-1.jpg"});
  obj.push({id:2,title:"iphoneX",old:9999,now:7888,img_url:"http://127.0.0.1:3333/img/shop/shop-2.jpg"});
  obj.push({id:3,title:"iphoneX",old:9955,now:7555,img_url:"http://127.0.0.1:3333/img/shop/shop-3.jpg"});
  obj.push({id:4,title:"iphoneX",old:9999,now:7888,img_url:"http://127.0.0.1:3333/img/shop/shop-4.jpg"});
  obj.push({id:5,title:"iphoneX",old:9955,now:7555,img_url:"http://127.0.0.1:3333/img/shop/shop-5.jpg"});
  obj.push({id:6,title:"iphoneX",old:9955,now:7555,img_url:"http://127.0.0.1:3333/img/shop/shop-6.jpg"});
  obj.push({id:7,title:"iphoneX",old:9955,now:7555,img_url:"http://127.0.0.1:3333/img/shop/shop-7.jpg"});
  res.send(obj);

});



//功能七:用户登录
app.get("/login",(req,res)=>{
  //1:获取参数 uname,upwd
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  //2:创建正则表达式验证
  //3:创建sql
  var sql = "SELECT count(id) as c";
  sql +=" FROM ip_login";
  sql +=" WHERE uname = ? AND upwd = md5(?)";
  pool.query(sql,[uname,upwd],(err,result)=>{
   if(err)throw err;
   var obj = result[0].c;
   if(obj == 1){
     //7.3 将用户名保存session 对象中
     req.session.uname=uname;
    res.send({code:1,msg:"登录成功"});
   }else{
    res.send({code:-1,msg:"用户名或密码有误"}) 
    }  
  });
  //4:返回结果
})


//功能八  加入购车
app.get("/addCart",(req,res)=>{
  //1:获取3个参数
  //需要第三方模块支持 bodyParser
  var uid = req.query.uid;
  var pid = req.query.pid;
  var c = req.query.count;
  //2:创建sql语句
  var sql  =" INSERT INTO `ip_shoppingcart_item`(`iid`, `user_id`, `product_id`, `count`, `is_checked`) VALUES (null,?,?,?,0)"

  pool.query(sql,[uid,pid,c],(err,result)=>{
       if(err)throw err;
       res.send({code:1,msg:"购物车添加成功"});
  });
  //3:返回添加结果
})



//功能九:查询购物详细信息
app.get("/getCarts",(req,res)=>{
  //1:获取参数 uname,upwd
  var uid = req.query.uid;
  //3:创建sql
  var sql =" SELECT c.iid,c.user_id,c.count";
  sql +=" ,p.price,p.lname,p.img";
  sql +=" FROM ip_laptop p,";
  sql +=" ip_shoppingcart_item c";
  sql +=" WHERE p.lid = c.product_id";
  sql +=" AND c.user_id = ?";
  uid = parseInt(uid);
  pool.query(sql,[uid],(err,result)=>{
   if(err)throw err;
   res.send({code:1,data:result});
  });
  //4:返回结果
})


// 功能十  更新购物车数量
app.get("/updateCart",(req,res)=>{
  //1 参数 iid   count
  var iid=req.query.iid;
  var count=req.query.count;
   //2 sql  update   
   var sql="update ip_shoppingcart_item set count = ? where iid= ? ";
   iid=parseInt(iid);
   count=parseInt(count);
   //3 json   {code:1,msg:"修改数量成功"}  
   pool.query(sql,[count,iid],(err,result)=>{
     console.log(result.affectedRows);
     if(err) throw err;
     if(result.affectedRows>0)
        res.send({code:1,msg:"修改数量成功"});
     else
        res.send({code:0,msg:"修改数量失败"});
   }) 
})


//功能十一:搜索商品
app.get("/search",(req,res)=>{
  //如果搜索参数太多
  //var color = req.query.color;
  //var are = req.query.are;
  //var sql = "SELECT ....";
  //if(color != undefined){
  //sql += "AND color="+color;
  //}
  //if(are != undefined){
  //  sql+"AND are = "+color
  //}


  //商品名称关键字
  var keyword = req.query.keyword;
  var low = req.query.low;
  var high = req.query.high;
  var sql = " SELECT lid,lname,price,img";
  sql +=" FROM ip_laptop";
  sql +=" WHERE lname LIKE ?";
  sql +=" AND price >= ?";
  sql +=" AND price <= ?";
  low = parseFloat(low);
  high = parseFloat(high);
  pool.query(sql,[`%${keyword}%`,low,high],(err,result)=>{
      if(err)throw err;
      if(result.length == 0){
        res.send({code:-1,msg:"您搜索商品不存在噢!"});
      }else{
        res.send({code:1,data:result})
      }
  });
})