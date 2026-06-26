import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pin_Box extends StatelessWidget {
  // final int? pin;
  const Pin_Box({
    super.key,
    // this.pin
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        // initialValue: pin.toString(),
        // readOnly: true,
        decoration: InputDecoration(

          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
