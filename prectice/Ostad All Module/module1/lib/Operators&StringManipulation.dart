import 'dart:io'; // Importing dart:io library to take user input and print output

void main() {

  stdout.write("Enter first number: ");  //in line input
  String? input1 = stdin.readLineSync(); // Reading input as nullable string (can be null)

  stdout.write("Enter second number: ");
  String? input2 =  stdin.readLineSync();  // input everything in a string

  // Converting input to integer safely using null-aware operators
  int num1 = int.tryParse(input1 ?? "") ?? 0; // If input1 is null or invalid → default to 0
  int num2 = int.tryParse(input2 ?? "") ?? 0; // Same for input2

  print("Addition: ${num1 + num2}"); // Adding two numbers
  print("Subtraction: ${num1 - num2}"); // Subtracting second from first
  print("Multiplication: ${num1 * num2}"); // Multiplying numbers
  print("Division: ${num1 / num2}"); // Dividing numbers (returns double)
  print("Integer Division: ${num1 ~/ num2}"); // Integer division (removes decimal part)
  print("Modulus: ${num1 % num2}"); // Remainder after division

  print("num1 > num2: ${num1 > num2}"); // Check if num1 is greater
  print("num1 < num2: ${num1 < num2}"); // Check if num1 is smaller
  print("num1 >= num2: ${num1 >= num2}"); // Check if num1 is greater or equal
  print("num1 <= num2: ${num1 <= num2}"); // Check if num1 is smaller or equal
  print("num1 == num2: ${num1 == num2}"); // Check if both are equal
  print("num1 != num2: ${num1 != num2}"); // Check if both are not equal

  print("(num1 > 0 && num2 > 0): ${num1 > 0 && num2 > 0}"); // AND operator (both conditions must be true)
  print("(num1 > 0 || num2 > 0): ${num1 > 0 || num2 > 0}"); // OR operator (any one condition true)
  print("!(num1 > 0): ${!(num1 > 0)}"); // NOT operator (reverses condition)

  //if null operator
  String? name=null;
  print("thank you for using our app ${name?? "Guest"}  ");

  // null awarness operator
  String? gender=null;
  //when gender is null then it will print default user
  gender ??= "male";
  print(gender);

} // End of main function