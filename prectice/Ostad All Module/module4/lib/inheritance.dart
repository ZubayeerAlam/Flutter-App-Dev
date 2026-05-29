class Animal{
  String name;
  int age;
  String bread;

  Animal(this.name, this.age, this.bread);
  void display(){
    print("Name: $name, Age: $age, Bread: $bread");
  }
}

class Dog extends Animal with walkable, swimable{        //inharite from animal
  String owner;

  // Dog(String name, int age, String bread): super(name, age, bread);
  Dog(super.name, super.age, super.bread,this.owner);    //another way
  void bark()=> print("Woof! Woof!");


  @override
  void display(){
    super.display();
    print("Owner: $owner");

  }
}

mixin walkable{     //mixin is a plug and play fun
  void walk()=> print("Walking...");
}
mixin swimable on Animal{           // another level security only animal class can use it
  void swim()=> print("Swimming...");
}

void main(){
  Dog myDog = Dog("Buddy", 3, "Golden Retriever", "John Doe");
  myDog.display();
  myDog.bark();
  myDog.swim();
  myDog.walk();
}