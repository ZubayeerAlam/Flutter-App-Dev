import 'dart:io';

void main(){
  /*Part 1: Basic Output (Hello Dart)
  Write a Dart program that prints the following output:
  Hello Dart!
  Welcome to Flutter Development.*/
  print("Hello Dart!");
  print("Welcome to Flutter Development");


  /*Part 2: Variables & Data Types
  Perform the following tasks:
  1. Declare a String variable to store your name
  2. Declare an int variable to store your age
  3. Declare a double variable to store your height
  4. Declare a bool variable to indicate whether you are a student
  Then print all the values.*/

  String name="Zubayeer Alam";
  int age=22;
  double height=5.8;
  bool isStudent=true;
  print(name);
  print(age);
  print(height);
  print(isStudent);


  /*Part 3: Nullability
  Implement the following:
  1. Declare a nullable variable (String?)
  2. Assign null to it initially
  3. Later assign a value and print it
  4. Use an if condition to check:
  - If null → print "Value is null"
  - Otherwise → print "Value is available"*/

  String? name1=null;
  name="Zubayeer Alam";
  print(name1);
  if(name1==null){
    print("Value is null");
  }else{
    print("Value is available");
  }


  /*Part 4: Operators
  Use the following variables:
  int a = 10;
  int b = 3;
  Perform and print:
  ● Addition
  ● Subtraction
  ● Multiplication
  ● Division
  ● Modulus*/

  int a=10;
  int b=3;
  print(a+b);
  print(a-b);
  print(a*b);
  print(a/b);
  print(a%b);


  /*Part 5: String Interpolation
  ● Create 2 variables: name & age.
  ● Assign values as hardcoded.
  Use string interpolation to print this:
  My name is [name] and I am [age] years old.
  (Use variables inside the string)*/

  String name_2;
  int age_2;
  name_2="Zubayeer Alam";
  age_2=22;
  print("My name is $name_2 and I am $age_2 years old.");


  /*Part 6: Control Flow (if-else)
  Write a program where:
  ● You take a student's marks (you can hardcode it)
  ● Print grade based on the following conditions:*/

  int marks=89;
  if(marks>=80){
    print("A+");
  }else if(marks>=70){
    print("A");
  }else if(marks>=60){
    print("A-");
  }else if(marks>=50){
    print("B");
  }else {
    print("Fail");
  }


  /*Part 7: Bonus Challenge ⭐
  Check whether a number is even or odd and print:
  The number is Even
  or
  The number is Odd*/

  int num=33;
  if(num%2==0){
    print("The number is Even");
  }else {
    print("The number is Odd");
  }
}
