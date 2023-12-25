import 'package:flutter/material.dart';
import 'package:witl/home_screen.dart';
import 'package:witl/input_data.dart';

class FetchAPI extends StatelessWidget {
  const FetchAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetching API"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen())
                );
            },
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: const Text("To Homescreen")
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InputData())
                );
            },
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: const Text("To Input Data")
            ),
          ),
        ],
      ),
    );
  }
}