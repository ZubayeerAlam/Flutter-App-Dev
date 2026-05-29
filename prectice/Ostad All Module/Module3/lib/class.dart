class Customer{

  String name;
  double balance;
  bool hasNid;
  bool? hasPassport;

  //dart also provide no constructor formate but in this case you have to use null-able datatype

  Customer(this.name, this.balance,{this.hasPassport}):hasNid = true;
  Customer.withPassport(this.name, this.balance, this.hasNid, this.hasPassport);

  void deposite(double amount){
    balance += amount;
  }

  void withdraw(double amount){
    balance -= amount;
  }

  void display(){
    print("Name: $name");
    print("Balance: $balance");
    print("Has Nid: $hasNid");
    print("Has Passport: ${hasPassport ?? "No"}");
  }
}

void main(){
  var customer1 = Customer("Ayaan", 1000);
  var customer2 = Customer.withPassport("Sara", 500, true, true);

  customer1.deposite(500);
  customer2.withdraw(200);

  customer1.display();
  customer2.display();
}

