class Customer {
  String name;
  double _balance;
  bool hasNid;
  bool? hasPassport;

  //dart also provide no constructor formate but in this case you have to use null-able datatype

  Customer(this.name, double balance, {this.hasPassport})
    : hasNid = true,
      _balance = balance{
        totalCustomer++;
}

  Customer.withPassport(
    this.name,
    double balance,
    this.hasNid,
    this.hasPassport,
  ) : _balance = balance{
    totalCustomer++;
  }

  // void deposite(double amount) {
  //   _balance += amount;
  // }

  set deposit(double value) {
    if (value < 0) {
      throw ArgumentError("Balance cannot be negative");
    }
    _balance = value;
  }

  void withdraw(double amount) {
    _balance -= amount;
  }

  double get balance => _balance*1.45;  //add interest

  static int totalCustomer=0;

  void display() {
    print("Name: $name");
    print("Balance: $_balance");
    print("Has Nid: $hasNid");
    print("Has Passport: ${hasPassport ?? "No"}");
  }
}
