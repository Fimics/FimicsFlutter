import 'package:flutter/material.dart';

//常用数据类型
class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    // _numType();
    // _stringType();
    _mapType();
    return Container(child: Text('常用数据类型 -' ,),);
  }

  //数字类型 是 int ,double的父类
  void _numType() {
    num num1 = -1.0;
    num num2 = 2;
    int int1 = 3;
    double d5 = 5.00;
    print("num1->$num1  num2->$num2  int1->$int1  d5$d5");
    print(num1.abs().toString());
    print(num2.toString());
  }

  void _stringType(){
     bool success =true,fail = false;
     print(success || fail);

     List list = [1,2,3,"collection"];
     print(list);
     List<int> list1 = [];
     list1.add(1);
     // list1.add(1.1); error

    List list3 = [];
    list3.addAll(list1);
    list3.addAll(list);
    print(list3);

    //生成器
    List l4 = List.generate(10, (index) => index*index);
    print(l4);

    for(int i=0;i<l4.length;i++){
      print(l4[i]);
    }

    print("------------------------");
    for(var i in l4){
      print(i);
    }

  }

  void _mapType(){
    Map names = {"A":"a","B":"b"};
    print(names);
    Map ages = {};
    ages ['a']=10;
    print(ages);

    ///遍历map
    ages.forEach((key, value) {
      print('$key -> $value');
    });

    Map ages2 =ages.map((key, value){
      //重新生成一个map ,颠倒 key ,value
      return MapEntry(value, key);
    });
    print(ages2);

    for(var key in names.keys){
      print('$key  -> $names[key]');
    }

    /// dynamic ,var ,object  区别
    /// dynamic 编译时不知道，运行时才知道具体数据类型，不能进行数据类型检查
    /// var 数据类型定义之后，不能再修改为其他数据类型
    /// object

    dynamic a = 1;
    print(1.runtimeType);
    var  b = 2;
    print(2.runtimeType);
    Object c = 3;
    print(c.runtimeType);
  }
}
