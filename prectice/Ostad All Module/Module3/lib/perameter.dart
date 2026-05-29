void main(){
  greetuser('zuba','Good Morning');
  named_greetuser(name:'zubia',message:'Good fMorning');
  named_greetuser(message:'Good fMorning',name:'zubyer');
  requied_greetuser(name:'zubyer',message:'Good fMorning');

  // named_greetuser(message:'Good fMorning' ,null);//wrong
  named_greetuser(null, 'Good fMorning');//right
}

void greetuser(String name,String message){
  print("Hello $name, $message");
}

void named_greetuser( String? name, String? message){
  print("Hello $name, $message");
}

void requied_greetuser({ required String name, required String message}){
  print("Hello $name, $message");
}

//defult fun
void greet_user({String name="Guest", String message = "Good Morning"}){
  print("Hello $name, $message");
}

//optional perameter and positional perameter
// void greet_user1(String? name , [String? message]){
//   print("Hello $name, $message");
// }