void main() {
// Position matters — args passed by ORDER
//   String formatName(String first, String last) {
//     return "$first $last";
//   }

// Must pass in exact order: first, then last
//   print(formatName("Ayaan", "Khan"));
// Ayaan Khan

// Can NOT skip or reorder:
// formatName(last: "Khan", first: "Ayaan"); ❌ error

//.................................................................................

// Names matter — args passed by LABEL
//   String formatName({String first = "", String last = ""}) {
//     return "$first $last";
//   }

// Curly braces { } wrap named params
// Order does NOT matter at the call site
//   print(formatName(first: "Ayaan", last: "Khan"));
//   print(formatName(last: "Khan", first: "Ayaan"));
// Both print: Ayaan Khan

//...................................................................................

// Square brackets [ ] = optional positional
//   String greet(String name, [String title = ""]) {
//     return title.isEmpty ? "Hello, $name!" : "Hello, $title $name!";
//   }
//
//   print(greet("Sara"));             // Hello, Sara!
//   print(greet("Sara", "Dr."));    // Hello, Dr. Sara!

//...................................................................................

  // Default values apply when argument is omitted
//
//   void sendNotif({
//   required String message,
//   String  channel  = "general",
//   bool    silent   = false,
//   int     priority = 3,
//   }) {
//   print("[$channel] $message (priority $priority)");
//   }
//
//   sendNotif(message: "Server down!");
// // [general] Server down! (priority 3)
//
//   sendNotif(message: "New post", channel: "posts", priority: 1);
// // [posts] New post (priority 1)

}