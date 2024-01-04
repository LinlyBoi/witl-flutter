import 'package:flutter/material.dart';
import 'package:witl/app_settings.dart';
import 'package:witl/fetcher.dart';
import 'package:witl/home_screen.dart';
import 'package:witl/input_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

  static MyAppState of(BuildContext context) =>
    context.findAncestorStateOfType<MyAppState>()!;
}

class MyAppState  extends State<MyApp> {
  ThemeMode _theme = ThemeMode.system;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Entry Point",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        brightness: Brightness.light,
        dividerColor: Colors.white54,
        scaffoldBackgroundColor: Colors.white,
      ),

      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        dividerColor: Colors.black12,
        scaffoldBackgroundColor: const Color(0xFF131313),

      ),

      themeMode: _theme,

      // Navigashun with Routes
      // Base "Home" Route
      initialRoute: '/',

      // Possible Routes
      routes: {
        // Login (Eventually)
        //'/login': (context) => const LogIn(),

        // Signup (Also eventually xd)
        //'/login/signup': (context) => const SignUp(),

        // Homescreen
        '/home': (context) => const HomeScreen(),
        
        // Fetching API Data
        '/fetch': (context) => const FetchAPI(),

        // User Input
        '/input': (context) => const InputData(),

        // Settings
        '/settings': (context) => const Settings(),
      },
    );
  }

  void changeTheme(String newTheme) {
    setState(() {
      switch(newTheme) {
        case "Light":
          _theme = ThemeMode.light;
          break;
        case "Dark":
          _theme = ThemeMode.dark;
          break;
        case "System Default":
          _theme = ThemeMode.system;
          break;
      }
    });
  }
}
