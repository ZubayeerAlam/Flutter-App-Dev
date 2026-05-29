import 'dart:io';

class List_Set_Map {

  S_et() {
    Set item1 = {11, 22, 33};
    print(item1);
    Set item = Set();
    item.add(1);
    item.add(2);
    item.add(3);
    print(item);
    item.remove(1);
    print(item);

    //set math
    Set item2={1,2,3,4,5};
    Set item3={4,5,6,7,8};
    print(item2.union(item3));
    print(item2.intersection(item3));
    print(item2.difference(item3));

  }

  L_ist() {
    // List<int> list=[1,2,3,4,5];
    // list.add(6);
    // print(list);
    // list.remove(5);
    // print(list);
    // list.removeAt(0);
    // print(list);
    // print(list.contains(6));
    // list.insert(0, 10);
    // print(list);
    // list.insertAll(0, [11,12,13]);
    // print(list);
    // list.removeRange(0, 3);
    // print(list);
    // print(list.length);
    // list.removeLast();
    // print(list);
    // list.last;
    // print(list);
    // list.clear();
    // print(list);

     List<int> growableList=[]
       ..add(22)
     ..add(33)      //cascading
     ..add(11);
     growableList.add(1);
     growableList.add(2);
     // growableList.sort();
    growableList.remove(1);
     // growableList.removeAt(0);
     // print(growableList);
     for(int i=0;i<growableList.length;i++){
       print(growableList[i]);
     }

     for(int num in growableList){
       print(num);
     }

     growableList.forEach(
           (element) {
             print(element);
           }
     );




    List<int> fixedlist = List.filled(5, 0);
    print(fixedlist);
    fixedlist[0] = 1;
    fixedlist[1] = 2;
    fixedlist[2] = 3;
    fixedlist[3] = 3;
    fixedlist[4] = 5;

    // fixedlist.add(1);   //add fun is not working bcz Cannot
    // add to a fixed-length list its alrdy have 0 insrt it
    print(fixedlist);
    List<int>uniquelist=fixedlist.toSet().toList();
    print(uniquelist);
  }


  M_ap() {
    Map<dynamic, dynamic> map;
    map = {1: "one", 2: "two", 3: "three"};
    print(map);
    map[4] = "four";
    map[5] = 3;
    //print(map);
    map.update(5, (value) => "five");
    // for(var n in map.keys){
    //   print(n);
    // }
    // for(var value in map.values){
    //   print(value);
    // }
    // for(var entry in map.entries){
    //   print(entry);
    // }

    map.forEach((key, value) => print("key is $key and value is $value")) ;


    map[3] = 33; //two type of update
    print(map);

    Map<String, int> map2 = {"ten": 10, "eleven": 11, "twelve": 12};
    map.addAll(map2);
    print(map);
    map.addAll({"thirteen": 13});
    print(map);
    map.remove("one"); //its not working becouse it is a value
    print(map);
    print(map.length);
    print(map.keys);
    print(map.values);
    print(map.containsKey("two"));



  }
}

void main(){

  List_Set_Map object=List_Set_Map();

  //list allow duplicate list has index list allow sort fun

  // object.S_et();
  // object.L_ist();
  object.M_ap();



}