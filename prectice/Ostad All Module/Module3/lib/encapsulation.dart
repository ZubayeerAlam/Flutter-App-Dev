import 'CustomerLibrary.dart';

void main() {
  var customer1 = Customer("Ayaan", 1000);
  var customer2 = Customer.withPassport("Sara", 500, true, true);

  customer1.deposit=500;
  customer2.withdraw(200);

  // customer2.balance=333333;
  //customer2 can modify his balance its illegal
  // to solve this problem we use private

  customer1.display();
  customer2.display();

  print(customer2.balance);
  print(Customer.totalCustomer);

}
