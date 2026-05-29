class Enemy {
  String name;
  int hp;
  Enemy(this.name, this.hp);

  String attack() => "$name attacks!";   // default behaviour
}

class Orc extends Enemy {
  Orc(super.name, super.hp);

  @override
  String attack() => "🪓 $name swings an axe!";
}

class Goblin extends Enemy {
  Goblin(super.name, super.hp);

  @override
  String attack() => "🗡️ $name stabs with a dagger!";
}

class Dragon extends Enemy {
  Dragon(super.name, super.hp);

  @override
  String attack() => "🔥 $name breathes fire!";
}

void main(){
  Enemy foe = Dragon("Smaug", 500);

  print(foe is Dragon);  // true  — it IS a Dragon
  print(foe is Enemy);   // true  — Dragon is-a Enemy
  print(foe is Orc);     // false — it's not an Orc
  print(foe is String);  // false — completely different type

// Negative check
  print(foe is! Orc);    // true  — "is NOT an Orc"

  Enemy e=Dragon("Smaug", 500);
  void handleEnemy(Enemy e) {
    if (e is Dragon) {
      // Inside this block, Dart KNOWS e is a Dragon.
      // It automatically "promotes" e to Dragon type.
      print(e.attack());  // Dragon's attack — no cast needed!
    }
  }

// Without smart promotion (how other languages do it):
  if (e is Dragon) {
    Dragon d = e as Dragon;   // explicit cast — NOT needed in Dart!
    d.attack();
  }
}