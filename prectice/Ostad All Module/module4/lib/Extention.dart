// extension StringUnit on String {
//   String Capitalise() => this[0].toUpperCase() + substring(1);
//
//   bool get ismail => contains("@") && contains(".");
// }
//
// void main() {
//   print("zubayeer".Capitalise()); // Zubayeer
//   print("zubayeer@GAMIL.COM".ismail);
// }




// Main class
class Student {
  String name;
  int marks;

  // Constructor
  Student(this.name, this.marks);
}

// Extension on Student class
extension StudentExtension on Student {
  // Getter: check pass/fail
  bool get isPassed => marks >= 40;

  // Method: calculate grade
  String grade() {
    if (marks >= 80) return "A+";
    if (marks >= 70) return "A";
    if (marks >= 60) return "B";
    if (marks >= 50) return "C";
    return "F";
  }

  // Method: formatted output
  String get summary {
    return "Name: $name | Marks: $marks | Grade: ${grade()} | Passed: $isPassed";
  }
}

// Extension on String (extra practice)
extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

void main() {
  // Create objects
  Student s1 = Student("zubayeer", 75);
  Student s2 = Student("rahim", 35);

  // Use extension features
  print(s1.summary);
  print(s2.summary);

  // Use String extension
  print("hello world".capitalize());
}