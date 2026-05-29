void main(){
  // Named function (has a name, stored permanently)
  int square(int x) => x * x;

// Anonymous function (no name, passed inline)
  List<int> nums = [1, 2, 3, 4, 5];

// Passed to forEach — no name, used immediately
  nums.forEach((int n) {
    print(n * n);
  });

// Arrow shorthand — same thing, one line
  nums.forEach((n) => print(n * n));

// Stored in a variable (a "lambda")
  var double = (int x) => x * 2;
  print(double(7)); // 14

  List<int> scores = [72, 45, 88, 91, 60];

// .where() — filter: keep scores >= 70
  var passing = scores.where((s) => s >= 70);
  print(passing.toList()); // [72, 88, 91]

// .map() — transform: double every score
  var doubled = scores.map((s) => s * 2);
  print(doubled.toList()); // [144, 90, 176, 182, 120]

// .reduce() — combine: sum all scores

  //show error
  // int total = scores.reduce((sum, s) => sum + s);
  // print(total); // 356

  var a = [22].map((x) => x);
  print(a.toList()); // [22] . //correct


}