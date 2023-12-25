import 'package:flutter/material.dart';
import 'package:witl/home_screen.dart';

class FetchAPI extends StatelessWidget {
  const FetchAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetching API"),
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Text("Go Home (Hopefully no homeless)"),
        ),
      ),
    );
  }
}