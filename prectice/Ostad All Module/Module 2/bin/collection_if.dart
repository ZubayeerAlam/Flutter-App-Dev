void main() {

  // collection if e 2nd bracket thakbe na
  bool isAdmin = true;
  bool isPremium = false;

  List<String> menu = [
    "Home",
    "Profile",
    if (isAdmin) "Admin Panel", // ✅ included
    if (isPremium) "Premium Content", // ❌ excluded
    "Settings",
  ];

  print(menu);
// [Home, Profile, Admin Panel, Settings]}


  bool showEmail = true;
  bool showPhone = false;

  Map<String, String> contact = {
    "name": "Ayaan",
    if (showEmail) "email": "ayaan@example.com",
    if (showPhone) "phone": "017xxxxxxxx",
  };

  print(contact);
// {name: Ayaan, email: ayaan@example.com}
// "phone" was not added because showPhone is false
}