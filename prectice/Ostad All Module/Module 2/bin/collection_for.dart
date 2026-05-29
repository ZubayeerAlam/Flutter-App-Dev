void main(){
  List<String> names = ["ayaan", "sara", "rafi"];

// Collection for — capitalise every name
  List<String> caps = [
    for (var n in names) n[0].toUpperCase() + n.substring(1),
  ];
  print(caps); // [Ayaan, Sara, Rafi]

// Build a Map from two lists
  List<int> scores = [88, 95, 74];

  Map<String, int> report = {
    for (int i = 0; i < names.length; i++)
      names[i]: scores[i],
  };
  print(report); // {ayaan: 88, sara: 95, rafi: 74}

}