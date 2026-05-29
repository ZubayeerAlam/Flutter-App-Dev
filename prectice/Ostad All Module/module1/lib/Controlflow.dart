import 'dart:io';
void main(){
  String grade=stdin.readLineSync()!.toUpperCase();
  if(grade=="A"){
    print("Excellent");
  }
  else if(grade=="B"){
    print("Good");
  }
  else{
    print("Fail");
  }


   switch (grade) {
      case "A":
      print("Excellent");
      case "B":
      print("Good");
      default:
      print("Fail");
  }


  //here, we can use var, string, int all type of variable
  Object value=stdin.readLineSync()!;  //always input in string
  switch(value){
    case int n when n==0:
    print("number is Zero");

    case int n when n<0:
      print("negative number");

    case int n when n>0:
      print("positive number");

    case String s:         //execute this line always
      print("string value");

    default:
      print("not a number");
  }
}