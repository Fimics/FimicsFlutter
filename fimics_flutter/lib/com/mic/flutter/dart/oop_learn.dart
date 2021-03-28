
class Person {
  String name;
  int age;

  Person(this.name, this.age);


  @override
  String toString() {
    return 'Person{name: $name, age: $age}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Person &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

class Student extends Person {

  //_用来标记私有变量
  String _school;
  // final String city;
  String city;
  String country;


  String name;

  //如果有父类，首先要调用父类的构造方法，: super(name, age) 称为初始化列表
  //this._school初始化自有参数， name,age交给super class 实始化
  //{this.city} 是可选参数  default params
  Student(this._school, String name, int age,
      {this.city, this.country = "china"})
      :
  //初始化列表是放在:后边的
        name='$country.$city.$name',
  //如果父类没有默认构造方法，需要要实始化列表中调用super class 的构造方法
        super(name, age) {
    print("构造方法体不是必须的，可有可无");
  }

  //get
  String get school=>_school;
  //set
  set school(String value){
    this._school = value;
  }

  //类名加方法名
  static doPrint(String msg){
      print("static $msg");
  }

  /// 为类实现多个构造方法
  Student.cover(Student student):super(student.name,student.age){
    print("命名构造方法...");
  }

  //命名工厂构造方法:factory [类名+.+方法名]
  //可以有返回值，不需要把类的final变量作为参数，是提供一种灵活获取对象的方式， 如果有final 字段，命名构造函数是必须要初始化 的 final 字段的
  factory Student.stu(Student student){
    return Student(student._school,student.name,student.age);
  }

  @override
  String toString() {
    return 'Student{_school: $_school, city: $city, country: $country, name: $name}';
  }
}

//工厂构造方法
class Logger{
  static Logger _cache;

  factory Logger(){
    if(null== _cache){
      _cache = Logger._internal();
    }
    return _cache;
  }

  Logger._internal();

  Logger._internal1();

  void log(String msg){
    print(msg);
  }
}

//抽象类
abstract class Study{
   study();

   void myPrint(String msg){
     print(msg);
   }
}


class StudyFlutter extends Study{

  @override
  study() {
    print("study flutter study");
  }

  @override
  void myPrint(String msg) {
    super.myPrint("study flutter->"+msg);
  }
}


/// 为类添加特性:mixins  （类似接口的用法与功能）
/// mixins 是在多个类层次结构中重用代码的一种方式
/// 要使用mixins,在with 关键字后面跟上一个或多个mixins名字

class Test extends Person with Study{

  Test(String name, int age) : super(name, age);

  @override
  study() {
    print(name +"at study");
  }

}