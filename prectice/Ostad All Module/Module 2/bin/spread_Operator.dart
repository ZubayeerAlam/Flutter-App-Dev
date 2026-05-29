void main(){
  List<String> fruits = ["apple", "mango"];
  List<String> veggies = ["carrot", "spinach"];

// Without spread — nested (wrong!)
  List bad = [fruits, veggies]; // [[apple,mango],[carrot,spinach]]

// With spread — flat (correct!)
  List<String> salad = [...fruits, ...veggies];
  print(salad); // [apple, mango, carrot, spinach]

// Add extra items alongside
  List<String> full = ["lemon", ...fruits, "pepper"];
  print(full); // [lemon, apple, mango, pepper]

  Map<String, String> defaults = { "theme": "light", "lang": "en" };
  Map<String, String> userPref = { "theme": "dark" };

// Merge — userPref overrides defaults for matching keys
  Map<String, String> config = {...defaults, ...userPref};
  print(config); // {theme: dark, lang: en}

// Null-safe spread — use ...? when the list might be null
  List<String>? extras = null;
  List<String> items = ["base", ...?extras]; // safe — no crash
  print(items); // [base]

}