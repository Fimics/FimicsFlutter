void skills() {
  String a = null;
  //安全调用
  a?.length;

  //设置默认值
  a?.length??20;

  //简化判断
  List list = [];
  list[0]=1;
  if(list[0]==null || list[0]=='' ||list[0]==0){
    print("empty");
  }
  //简化写法
  if([null ,'',0].contains(list[0])){
    print('empty');
  }
}
