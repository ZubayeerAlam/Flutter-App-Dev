//Instructions that take time (asynchronous)

// These can take milliseconds, seconds, or even minutes:
// • Download a JSON from a server
// • Read a large file from disk
// • Query a database
// • Wait for user to pick a photo
// • Wait 3 seconds with a timer

// The CPU isn't doing the work — it's waiting for
// the network, disk, or another device to respond.

/*
    genetic-> . (jekunu kischu)
    Future<T>   T- generic
                Genetic type
                int ,double , num ,string ,bool
*/

// Future<T>   -> at this moment i have no value but i will give you letter

// Future.delayed runs some code after a delay — great for practice
Future<String> fetchUsername() {
  return Future.delayed(
    Duration(seconds: 2),
        () => "Ayaan",         // this becomes the Future's value
  );
}

Future<int> fetchScore() {
  return Future.delayed(
    Duration(seconds: 3),
        () => 100,
  );
}

Future<void> saveToDisk() {
  return Future.delayed(
    Duration(seconds: 1),
        () => print("done"),
  );
}

void main(){
// Type tells you what will eventually arrive
  Future<String>  name   = fetchUsername();  // eventually a String
  Future<int>     score  = fetchScore();     // eventually an int
  Future<void>    saved  = saveToDisk();    // eventually just "done"
}