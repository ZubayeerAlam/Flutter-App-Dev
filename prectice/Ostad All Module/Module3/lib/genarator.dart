// Marked sync* → returns Iterable<T> lazily
Iterable<int> countTo(int n) sync* {
  for (int i = 1; i <= n; i++) {
    print("  (generator: about to yield $i)");
    yield i;        // "hand one value to the caller, then pause"
  }
}

void main() {
  print("before loop");

  for (int v in countTo(3)) {
    print("main got: $v");
  }
}

// before loop
//   (generator: about to yield 1)
// main got: 1
//   (generator: about to yield 2)
// main got: 2
//   (generator: about to yield 3)
// main got: 3

// Marked async* → returns Stream<T>
Stream<int> countdown(int from) async* {
  for (int i = from; i >= 1; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i;        // push this value into the stream
  }
}

Future<void> main2() async {
  await for (int i in countdown(3)) {
    print("tick $i");
  }
  print("blast off!");
}

// tick 3   ← after 1s
// tick 2   ← after 2s
// tick 1   ← after 3s
// blast off!