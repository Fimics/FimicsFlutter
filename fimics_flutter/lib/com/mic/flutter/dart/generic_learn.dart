
import 'oop_learn.dart';

class TestGeneric {

  void start() {
    Cache<String> cache = Cache();
    cache.setItem("a", "a");

    Cache<int> cache1 = Cache();
    cache1.setItem("b", 2);
  }
}

class Cache<T> {
  static final Map<String, Object> _cached = Map();

  void setItem(String key, T value) {
    _cached[key] = value;
  }

  T getItem(String key) {
    return _cached[key];
  }
}


class MemberM<T extends Person>{
    T _person;

    MemberM(this._person);

    void fixedName(){

    }
}