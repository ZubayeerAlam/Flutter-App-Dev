void main(){
  //way 1
  // int add(int a, int b) {
  //   return a + b;
  // }
  //
  // bool isEven(int n) {
  //   return n % 2 == 0;
  // }
  //
  // String greet(String name) {
  //   return "Hello, $name!";
  // }

  // //way 2
  int add(int a, int b)
  => a + b;

  bool isEven(int n)
  => n % 2 == 0;

  String greet(String name)
  => "Hello, $name!";

  //.............................................................
  //Arrow with named parameters & in practice
  // Arrow + named parameters
  double tax({required double price, double rate = 0.15})
  => price * rate;

  print(tax(price: 1000));       // 150.0
  print(tax(price: 500, rate: 0.05)); // 25.0

// Very common in List methods (sort, where, map)
  List<int> nums = [5, 1, 3, 2, 4];

  //compare(5, 1) → a = 5, b = 1
  // compare(3, 1) → a = 3, b = 1
  //If result < 0 → a comes before b
  // If result > 0 → b comes before a
  // If result = 0 → no change

  nums.sort((a, b) => a - b);
  print(nums); // [1, 2, 3, 4, 5]





}