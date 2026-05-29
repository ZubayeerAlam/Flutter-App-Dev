abstract class paymentMethod {
  void charge(double amount);

  void refund(double amount) {
    print("Refunding $amount");
  }
}

class CreditCard extends paymentMethod {
  void charge(double amount) {
    print("Charging $amount with Credit Card");
  }
}

//when we use extends keyword we dont have to implement all the method of abstract class
class PayPal extends paymentMethod {
  void charge(double amount) {
    print("Charging $amount with PayPal");
  }
}

//when we use implements keyword we have to implement all the method of abstract class
class Bikash implements paymentMethod {
  void charge(double amount) {
    print("Charging $amount with Bikash");
  }

  void refund(double amount) {
    // print("Refunding $amount with Bikash");
  }
}

void checkout(paymentMethod method, double amount) {
  method.charge(amount);
  method.refund(amount);
}

void main() {
  //we cannt create object of abstract class
  // CreditCard myCreditCard = CreditCard();
  // PayPal myPayPal = PayPal();
  // myPayPal.refund(300);
  // checkout(myCreditCard, 100);
  // checkout(myPayPal, 200);

  Bikash myBikash = Bikash();
  // myBikash.charge(300);
  myBikash.refund(300);
  checkout(myBikash, 300);
}
