import 'package:flutter/material.dart';
import 'package:witl/app_settings.dart';
import 'package:witl/fetcher.dart';
import 'package:witl/home_screen.dart';
import 'package:witl/input_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Entry Point",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Navigashun with Routes
      // Base "Home" Route
      initialRoute: '/',

      // Possible Routes
      routes: {
        // Homescreen
        '/': (context) => const HomeScreen(),
        
        // Fetching API Data
        '/fetch': (context) => const FetchAPI(),

        // User Input
        '/input': (context) => const InputData(),

        // Settings
        '/settings': (context) => const Settings(),
      },
    );
  }
}
