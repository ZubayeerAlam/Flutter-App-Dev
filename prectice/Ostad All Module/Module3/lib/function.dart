import 'dart:io';

//Functions, Lambdas

void main() {
  // int a, b;
  // a = int.parse(stdin.readLineSync()!);
  // b = int.parse(stdin.readLineSync()!);
  // print("sum of a & b is ${add(a, b)}");
  //
  // //anonymous fun...........................
  // int sum = ((int a, int b) => a + b)(a, b);
  //
  // List<int> numbers = [1, 2, 3, 4, 5];
  // numbers.forEach((int n) {
  //   print(n);
  // });
  //
  // numbers.forEach((int n) => print(n));


  //........................................


  //Anatomy of a Function
  // returnType  functionName  (parameters) { body }
  // 👉 Function anatomy = Return type + Name + Parameters + Body
// Call them:
  print(add(3, 4));       // 7
  print(greet("Sara"));  // Hello Sara
  log("App started");   // App started

  greet_2("Ayaan"); // Hello, Ayaan! Welcome back.
  greet_2("Sara");  // Hello, Sara! Welcome back.
  greet_2("Rafi");  // Hello, Rafi! Welcome back.


}

//Anatomy of a Function


int  add    (int a, int b)  { return a + b; }
String greet_2 (String name) { return "Hello $name"; }
void   log   (String msg)  { print(msg); } // void = no return value


void greet(String name) {
  print("Hello, $name! Welcome back.");
  print("You have 3 new messages.");
}


// //block body style
// int add(int a, int b) {
//   return a + b;
// }


// //expression style
// int multiple(int a, int b) => a * b;


// //anonymous fun
//
// int result = (() => 3 + 3)();
