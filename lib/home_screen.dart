import 'package:flutter/material.dart';
import 'package:witl/fetcher.dart';
import 'package:witl/input_data.dart';
import 'package:witl/app_settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Our Amazing Logo
            Image.asset('assets/images/choo.png',
              fit: BoxFit.contain,
              height: 64,
            ),
            
            // Spacing
            const SizedBox(width: 10,),
            
            // App Title
            const Text("WITL"),
            
            // Fill out the area blankly
            // So that the icon can be shoved far right
            const Expanded(child: SizedBox(),),

            // Navigate to Settings
            IconButton(
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings())
              );},
              icon: const Icon(Icons.settings)),
              
              // Space from the end
              const SizedBox(width: 30,),
            ]
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              // Our Motto (?)
              Text("We may not be able to tell you why.\nBut surely are able to predict when."),
            ],
          ),

          // Spacing
          const SizedBox(height: 80),
          
          // To the fetching screen
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
          
          const SizedBox(height: 30),
          
          // To Data Input
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