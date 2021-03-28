
class TestFunction{

  FunctionLearn functionLearn = FunctionLearn();
  void start(){
    print(functionLearn.sum(1,2));
    functionLearn.anonymousFunction();
  }
}


class FunctionLearn{
  int sum(int a ,int b ){
    return a+b;
  }

  _learn(){
    print("私有方法");
  }

  //匿名方法
  anonymousFunction(){
    var list = ['1','2'];
    list.forEach((element) {
      print(list.indexOf(element).toString()+": "+element);
    });
  }
}