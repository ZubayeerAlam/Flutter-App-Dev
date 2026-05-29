/*
💡
Why this matters in Flutter

// Flutter widgets use named parameters everywhere
Text(
"Hello World",          // positional (the text)
style: TextStyle(
fontSize: 24,            // named, optional
fontWeight: FontWeight.bold, // named, optional
color: Colors.blue,        // named, optional
),
)

// All named → you can pass in any order, skip any optional one

*/

void main() {
  // required: caller MUST provide this argument
  void createAccount({
    required String username, // must pass
    required String email, // must pass
    bool isAdmin = false, // optional — defaults to false
    int maxPosts = 100, // optional — defaults to 100
  }) {
    print("Created: $username, admin=$isAdmin, maxPosts=$maxPosts");
  }

  createAccount(
    username: "ayaan_dev",
    email: "ayaan@example.com",
  ); // Created: ayaan_dev, admin=false, maxPosts=100

  createAccount(
    username: "sara_admin",
    email: "sara@example.com",
    isAdmin: true,
    maxPosts: 500,
  ); // Created: sara_admin, admin=true, maxPosts=500
}


