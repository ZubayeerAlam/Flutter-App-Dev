import 'package:flutter/cupertino.dart';

class ProgressTouchScreen extends StatefulWidget {
  const ProgressTouchScreen({super.key});

  @override
  State<ProgressTouchScreen> createState() => _State();
}

class _State extends State<ProgressTouchScreen> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: Text("Progress Touch Screen"),
      ),
    );
  }
}
