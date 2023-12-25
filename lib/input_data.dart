import 'package:flutter/material.dart';
import 'package:witl/fetcher.dart';
import 'package:witl/home_screen.dart';

class InputData extends StatelessWidget {
  const InputData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Input"),
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
                MaterialPageRoute(builder: (context) => const FetchAPI())
                );
            },
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: const Text("To Fetch Data")
            ),
          ),
        ],
      ),
    );
  }
}