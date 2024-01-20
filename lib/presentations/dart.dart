import 'package:flutter/material.dart';
import 'work.dart';

class Sending extends StatefulWidget {
  const Sending({super.key});

  @override
  State<Sending> createState() => _SendingState();
}

class _SendingState extends State<Sending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Image.asset("assets/images/100pay.png", width: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("You're sending"),
              ),
            ],
          ),
          Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50.0,
              child: Expanded(
                // Use Expanded to ensure the TextField takes up the available space
                child: TextField(
                  enabled: false, // Disables the TextField
                  decoration: InputDecoration(
                    labelText: '₦',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Expanded(
              // Use Expanded to ensure the TextField takes up the available space
              child: TextField(
                enabled: false, // Disables the TextField
                decoration: InputDecoration(
                  labelText: '100',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // You can add more widgets to the Row here
          ],
        ),
      ),
    ),
SizedBox(
  height: 350,
),
    Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  
                },// Call the API when the button is pressed
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.blue.shade900,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}