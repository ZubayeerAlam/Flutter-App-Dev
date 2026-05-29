// Future<String> fetchUsername() =>
//     Future.delayed(Duration(seconds: 2), () => "Zubayeer");

Future<void> fetchUsername() async {
  final name = await Future.delayed(Duration(seconds: 2), () => "Ayaan");
  print(name);

}

void main() {
  print("1. asking for username…");

  // fetchUsername().then((name) {      //this name is using callback fun
  //   print("3. got: $name");
  // })
  //     .catchError((err) {
  //   print("4. error: $err");
  // }).whenComplete(() {
  //   print("5. done");
  // })
  //;

  //another way to do it

  try{
    fetchUsername();           //this is using async fun and await
  }
  catch(err){
    print("4. error: $err");
  }
  finally{
    print("5. done");
  }

  print("2. main() keeps going — not blocked!");
}

// Output order:
// 1. asking for username…
// 2. main() keeps going — not blocked!
// 3. got: Ayaan        (← 2 seconds later)