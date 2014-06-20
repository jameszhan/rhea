
#include<iostream>

using namespace std;

template<class Argument, class Result>
struct functor{
  typedef Argument argument_type;
  typedef Result result_type;
};

template<class T>
struct op : public functor<T, T>{
  T operator()(const T& x, const T& y) const{ return x - y; }
};


int main(){
  op<int> minusobj, testobj;
  cout << minusobj(3, 5) << endl;
  cout << testobj(13, 5) << endl;
  cout << op<int>()(113, 5) << endl;
  cout << op<int>()(13, -5) << endl;
  cout << op<int>()(313, 5) << endl;
  return 0;
}
