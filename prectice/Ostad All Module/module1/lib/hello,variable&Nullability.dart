//interview qstn
//dart start hoy main() theke
//fluter start hoy runapp() theke


class List_Set_Map{
  S_et(){
    Set item1={11,22,33};
    print(item1);
    Set item=Set();
    item.add(1);
    item.add(2);
    item.add(3);
    print(item);
    item.remove(1);
    print(item);
  }

  L_ist(){
    List<int> list=[1,2,3,4,5];
    list.add(6);
    print(list);
    list.remove(5);
    print(list);
    list.removeAt(0);
    print(list);
    list.contains(6);
    list.insert(0, 10);
    print(list);
    list.insertAll(0, [11,12,13]);
    print(list);
    list.removeRange(0, 3);
    print(list);
    print(list.length);
    list.removeLast();
    print(list);
    list.last;
    print(list);
    list.clear();
    print(list);
  }

  M_ap(){
    Map<dynamic,dynamic> map;
    map={1:"one",2:"two",3:"three"};
    print(map);
    map[4]="four";
    map[5]=3;
    print(map);
    map.update(5, (value) => "five");
    print(map);
    map[3]=33;  //two type of update
    print(map);

    Map<String,int> map2={"ten":10,"eleven":11,"twelve":12};
    map.addAll(map2);
    print(map);
    map.addAll({"thirteen":13});
    print(map);
    map.remove("one");//its not working becouse it is a value
    print(map);
    print(map.length);
    print(map.keys);
    print(map.values);
    print(map.containsKey("two"));

  }
}

void main(){

  print("hello Zubayeer");
  String name="zubayeer Alam";

  //multi line string
  print(''' 
  hello my name is $name
  today we are learning dart
  topic is
  variable,nullable & set map list 
  ''' );

  int age=22;
  bool isTrue=true;
  double pi=3.14;
  var name2="Rifat";
  dynamic name3="Rifat khan";
  // print(name);
  name3=99;

  // print(name);
  // print(name2);
  // print(isTrue);
   print("value of pi is $pi");
  // print(name);
  // print(age);

  const String appName="Facebook";  //compile time constant
  // print(appName);

  final String startUpTime;     //Runtime constant
  startUpTime="11:11 PM";
  // print(startUpTime);

  List_Set_Map object=List_Set_Map();   //object=data+action

  // object.S_et();
  // object.L_ist();
  // object.M_ap();


  // Nullable
  String? name4;
  name4="zubayeer";  //they might have a value

  //null aware access operator
  print(name4?.toUpperCase());  // here, ? is for safe exit  //? ! is a null aware operator
  print(name4!.toUpperCase());  // here, ! is for force exit


}









/*
print("Add Student :");
          var value=stdin.readLineSync()!;
          studentList.add({"name": value});
          continue;


          print("Record Score");
          var value=stdin.readLineSync()!;
          studentList.add({"score": value});

          print("Add Bonus Points");
          var value=stdin.readLineSync()!;
          studentList.add({"bonus": value});

           print("Add Comment");
          var value=stdin.readLineSync()!;
          studentList.add({"comment": value});


          print("View All Students");
          for(var student in studentList){
            print(student);
          }



           print("View Report Card");
          // for(var student in studentList){
          //   print(student);
          // }


          print("Class Summary");
          for(var student in studentList){
            print(student);
          }
 */





















