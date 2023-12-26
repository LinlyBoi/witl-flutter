import 'package:flutter/material.dart';

class FetchAPI extends StatelessWidget {
  const FetchAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetching API"),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false
              );
            },
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: const Text("Homescreen")),
          ),
        ],
      ),
    );
  }
}