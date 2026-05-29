import 'dart:io';

void main() {
  //practicing List(Ordered Data)
  List<dynamic> growAbleList = [];

  //add fun implement
  growAbleList.add(1);
  growAbleList.add(2);
  growAbleList.add(3);
  growAbleList.add(4);
  growAbleList.add(5);

  //remove fun implement
  growAbleList.remove(2);
  growAbleList.removeLast();
  growAbleList.removeAt(0);

  //insert fun implement
  growAbleList.insert(0, 10);
  growAbleList.insertAll(0, [11, 12, 13]);

  print(growAbleList);

  //fixed length list
  List<int> fixedList = List.filled(5, 0);

  //assign value to fixed length list

  fixedList[0] = 1;
  fixedList[1] = 2;
  fixedList[2] = 3;
  fixedList[3] = 4;
  fixedList[4] = 5;

  //fixed length list is not support add fun
  //fixed length list is not support remove fun
  //fixed length list is not support insert fun

  print(fixedList);

  //Practicing Sets(Unordered elements).........................
  Set<int> set = {1, 2, 2, 3, 4, 3, 4, 5};
  //set is not support duplicate value
  print(set); //{1, 2, 3, 4, 5} //duplicate value remove

  //add fun implement
  set.add(6);
  set.add(7);
  set.add(8);
  set.add(9);
  set.add(10);

  //remove fun implement
  set.remove(1);
  set.remove(2);
  set.remove(3);

  //adding fun implement
  set.addAll([11, 12, 13, 14, 15]);
  set.add(16);
  set.add(17);

  print(set);

  //perform math operation on sets
  Set<int> set1 = {1, 2, 3, 4, 5};
  Set<int> set2 = {4, 5, 6, 7, 8};

  //union fun implement
  print(set1.union(set2));
  //intersection fun implement
  print(set1.intersection(set2));
  //difference fun implement
  print(set1.difference(set2));

  //Practicing Maps(Key-Value Pairs).........................
  Map<String, dynamic> studentList = {
    "name": "ayaan",
    "age": 22,
    "grade": "A",
    "Subject": "Math",
  };
  print(studentList);

  //Working with nested Maps
  Map<int, Map<String, dynamic>> studentList2 = {
    1: {"name": "ayaan", "grade": "A"},
    2: {"name": "sara", "grade": "B"},
    3: {"name": "rafi", "grade": "C"},
    4: {"name": "rafi", "grade": "C"},
  };
  print(studentList2);

  //Using map methods and collection operators
  Map<String, dynamic> studentList3 = {
    "name": "ayaan",
    "age": 22,
    "grade": "A",
    "Subject": "Math",
  };

  print(studentList3.values);
  print(studentList3.keys);
  print("-----------------------------------------------------------");

  //Planning the student info System mini project

  print("This is a Student info Project..........................");

  List<Map<String, dynamic>> studentContains = [];

  do {
    String? name;
    int? Roll;
    String? grade;

    //give option for users
    print(
      "Do you want to add students other wise no(n) for see all student info? (y/n)",
    );
    print("press R for remove student");
    print("press u for update student info");

    String answer = stdin.readLineSync()!;

    //compare those option
    if (answer == "y") {
      //Add new student
      print("Enter the student name");
      name = stdin.readLineSync()!;
      print("Enter the student Roll");
      Roll = int.parse(stdin.readLineSync()!);
      print("Enter the student grade");
      grade = stdin.readLineSync()!;

      Map<String, dynamic> student = {
        "name": name,
        "Roll": Roll,
        "grade": grade,
      };
      studentContains.add(student);
      print("Student added successfully");
    } else if (answer.toLowerCase() == "n") {
      //Display all student
      print("Student info");
      for (var student in studentContains) {
        print("Name: ${student["name"]}");
        print("Roll: ${student["Roll"]}");
        print("Grade: ${student["grade"]}");
        print("------------------------------------");
      }
    } else if (answer.toUpperCase() == "R") {
      //Remove student
      print("Enter the student name you want to remove");
      name = stdin.readLineSync()!;
      studentContains.remove(name);
    } else if (answer.toUpperCase() == "U") {
      //Update student
      print("Enter the student name you want to update");
      name = stdin.readLineSync()!;

      for (var student in studentContains) {
        if (student["name"] == name) {
          print("Enter the student new name");
          name = stdin.readLineSync()!;
          print("Enter the student new Roll");
          Roll = int.parse(stdin.readLineSync()!);
          print("Enter the student new grade");
          grade = stdin.readLineSync()!;
        }
      }

      Map<String, dynamic> student = {
        "name": name,
        "Roll": Roll,
        "grade": grade,
      };
      studentContains.add(student);
    }

    print('''
    press R for remove student
    press y for add student
    press n for see all student info
    press u for update student info
    press any key for exit
    ''');
    answer = stdin.readLineSync()!;
    if (answer.toLowerCase() != "y" ||
        answer.toLowerCase() != "n" && answer.toLowerCase() != "r") {
      break;
    }
    print("------------------------------------");
  } while (true);

}
