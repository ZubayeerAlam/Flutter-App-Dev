import 'dart:convert'; // gives us jsonDecode and jsonEncode

void main() {
  // This is what a server sends — a plain String
  String jsonText = '''
  {
    "name": "Ayaan Khan",
    "age": 22,
    "city": "Dhaka",
    "scores": [88, 95, 74]
  }
  ''';

  // Convert JSON string → Dart Map
  Map<String, dynamic> user = jsonDecode(jsonText);

  // Now use it like any Map
  print(user["name"]); // Ayaan Khan
  print(user["age"]); // 22
  print(user["scores"]); // [88, 95, 74] — a List!

  Map<String, dynamic> user2 = {
    "name": "Ayaan",
    "score": 92,
  };

  String json = jsonEncode(user2);
  print(json);
// {"name":"Ayaan","score":92}
// This string is what you send over HTTP

}