import 'package:flutter/material.dart';
import 'package:witl/input_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Placeholder for Home Screen"),
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InputData()),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Text("Data Input Page (Hopefully)"),
        ),
      ),
    );
  }
}