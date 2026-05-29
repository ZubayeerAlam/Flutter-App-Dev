import 'pollymorphism.dart';

void main() {
//   Enemy enemy;
//   enemy = Orc("Orc", 100);
//   print(enemy.attack());
//
//   enemy = Goblin("Goblin", 80);
//   print(enemy.attack());
//
//   enemy = Dragon("Dragon", 200);
//   print(enemy.attack());

//Another and better way

  List<Enemy> enemies = [
    Orc("Orc", 100),
    Goblin("Goblin", 80),
    Dragon("Dragon", 200)];

  for(var enemy in enemies){
  print(enemy.attack());
  }
}

