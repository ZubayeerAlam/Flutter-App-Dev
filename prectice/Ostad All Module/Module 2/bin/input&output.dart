import 'dart:io';
void main() {
  int nam1;
  int nam2;
   stdout.write("enter num1 & num2"); //jut use for oneline output
  // stdout.write("enter num1");
  // print("enter num1");
  // print("enter num2");   //print use for nxtline
  nam1 = int.parse(stdin.readLineSync()!);
  nam2 = int.parse(stdin.readLineSync()!);
  int sum=nam1+nam2;
  print(sum);

  stdout.write("multiple 2num in double");
  double num1=double.parse(stdin.readLineSync()!);
  double num2=double.parse(stdin.readLineSync()!);
  double mul=num1*num2;
  print(mul);

  bool flag=bool.parse(stdin.readLineSync()!);
  print(flag);

  var a=2;
  var b=3;
  var SUM=a+b;
  print(SUM);


}
