import 'package:flutter/material.dart';
import 'package:witl/fetcher.dart';

class InputData extends StatelessWidget {
  const InputData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Input"),
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FetchAPI()),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Text("API Fetching (Hopefully)"),
        ),
      ),
    );
  }
}