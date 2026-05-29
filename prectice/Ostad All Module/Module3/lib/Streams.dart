// Consuming a Stream
// Two main ways to react to each value a stream delivers: .listen() (callback style) and await for (async style).

//for way 2
Future<void> printTicks() async {
  Stream<int> ticks = Stream.periodic(
    Duration(seconds: 1), (c) => c,
  ).take(5);

  try {
    await for (int value in ticks) {
      print("got: $value"); // runs for each value
    }
    print("stream finished"); // runs once at the end
  } catch (e) {
    print("oops: $e");
  }
}


Future<void> main() async {
  //way 1
  // Stream<int> ticks = Stream.periodic(
  //   Duration(seconds: 1),
  //       (count) => count,
  // ).take(5);  // only the first 5 values, then stop
  //
  // ticks.listen(
  //       (value) => print("got: $value"),   // onData — each value
  //   onError: (e) => print("oops: $e"),    // any error
  //   onDone:  () => print("stream finished"), // when closed
  // );

// Output (one per second):
// got: 0 → got: 1 → got: 2 → got: 3 → got: 4 → stream finished

//way 2
  await printTicks();
}


