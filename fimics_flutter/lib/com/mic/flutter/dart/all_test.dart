import 'data_type.dart';
import 'function_learn.dart';
import 'oop_learn.dart';

void allTest(){
  DataType();
  _oopLearn();
}

void _oopLearn(){
  Logger logger = Logger();
  logger.log("logger");
  Logger logger1 = Logger();
  print(logger1==logger);

  Student.doPrint("test");

  Student stu = Student("三中", "jack", 12);
  stu.school="985";
  print(stu.toString());

  Student stu1 = Student("二中", "jack", 12,city: "beijing",country: '中国');
  print(stu1.toString());

  Study study = StudyFlutter();
  study.study();
  study.myPrint("test");

  Test test = Test("hello", 20);
  test.study();

  TestFunction testFunction = TestFunction();
  testFunction.start();
}