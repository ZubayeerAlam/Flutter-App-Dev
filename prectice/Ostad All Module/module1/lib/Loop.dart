void main() {

  print("----- for loop -----");
  for (int i = 1; i <= 5; i++) {
    print(i);
  }

  print("\n----- while loop -----");
  int i = 1;
  while (i <= 5) {
    print(i);
    i++;
  }

  print("\n----- do-while loop -----");
  int j = 1;
  do {
    print(j);
    j++;
  } while (j <= 5);

  print("\n----- for-in loop -----");
  List<int> numbers = [10, 20, 30];
  for (int num in numbers) {
    print(num);
  }

  print("\n----- forEach loop -----");
  List<String> names = ["A", "B", "C"];
  names.forEach((name) {
    print(name);
  });

  print("\n----- break example -----");
  for (int k = 1; k <= 5; k++) {
    if (k == 3) break;
    print(k);
  }

  print("\n----- continue example -----");
  for (int m = 1; m <= 5; m++) {
    if (m == 3) continue;
    print(m);
  }

  int a=null;
}