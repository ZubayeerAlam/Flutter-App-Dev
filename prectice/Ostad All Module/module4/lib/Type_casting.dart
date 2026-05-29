void main() {
  Object mystery = "Hello, Dart";

  // You KNOW it's a String, tell Dart explicitly
  String text = mystery as String;
  print(text.toUpperCase()); // HELLO, DART

  // ⚠️ DANGER — if the cast is wrong, it CRASHES at runtime
  int num = mystery as int; // 💥 TypeError!🛡️

  // Safe pattern:is first, then access freely

  // ✅ SAFE — check first, Dart promotes automatically
  if (mystery is String) {
    print(mystery.toUpperCase()); // no cast needed!
  }

  // ❌ UNSAFE — as without checking first
  print((mystery as String).toUpperCase()); // crashes if not a String}
}
