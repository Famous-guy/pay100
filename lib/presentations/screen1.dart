import 'package:flutter/material.dart';

class Payinit extends StatefulWidget {
  const Payinit({super.key});

  @override
  State<Payinit> createState() => _PayinitState();
}

class _PayinitState extends State<Payinit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(),
            )
          ],
        ),
      )
    );
  }
}