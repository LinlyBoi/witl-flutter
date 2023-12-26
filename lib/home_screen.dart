import 'package:flutter/material.dart';
import 'package:witl/fetcher.dart';
import 'package:witl/input_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Placeholder for Home Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text("We may not be able to tell you why.\nBut surely are able to predict when."),
            ],
          ),

          const SizedBox(height: 80),
          

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