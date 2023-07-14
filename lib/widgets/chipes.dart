import 'package:flutter/material.dart';

class Chipes extends StatelessWidget {
  const Chipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Chip(
          label: Text("My Tasks"),
          elevation: 8,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
        ),
        Chip(
            label: Text("In-progress"),
            elevation: 8,
            shadowColor: Colors.white),
        Chip(
            label: Text("Completed"),
            elevation: 8,
            shadowColor: Colors.white),
      ],
    );
  }
}
