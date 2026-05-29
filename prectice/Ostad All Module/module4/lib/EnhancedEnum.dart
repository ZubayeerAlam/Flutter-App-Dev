enum Priority {
  // Each value calls the constructor
  low(1, "Low"),
  medium(2, "Medium"),
  high(3, "High"),
  critical(4, "🔴 Critical");   // ← semicolon after last value

  // Fields
  final int level;
  final String label;

  // Constructor — must be const
  const Priority(this.level, this.label);

  // Getter
  bool get isUrgent => level >= 3;

  // Method
  String display() => "[$label] Priority level $level";
}

void main() {
  var p = Priority.critical;
  print(p.label);     // 🔴 Critical
  print(p.isUrgent);  // true
  print(p.display()); // [🔴 Critical] Priority level 4
}
