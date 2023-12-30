import 'package:flutter/material.dart';
import 'package:witl/main.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  late String selectedTheme = 'Dark';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),

      body: ListView(
        children:[
          ListTile(
            title: const Text("App Theme"),
            subtitle: const Text("Sets the theme of the app between: Dark, Light, System Default."),
            trailing: DropdownButton<String> (
              value: selectedTheme,
              items: <String>["Light", "Dark", "System Default"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  );
              }).toList(),
              onChanged: (String? updatedTheme) {
                setState(() {
                  selectedTheme = updatedTheme ?? selectedTheme;
                  MyApp.of(context).changeTheme(selectedTheme);
                });
              },
            ),
          )
        ],
      )
    );
  }
}