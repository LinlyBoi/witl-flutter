import 'package:flutter/material.dart';
import 'package:witl/fetcher.dart';
import 'package:witl/home_screen.dart';

class InputData extends StatefulWidget {
  const InputData({super.key});

  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  late String selectedColor = 'Blue'; // Default color
  late String selectedLine = '1'; // Default line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Input"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Choose Tram Line and Colour"),
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Line:"),
              SizedBox(width: 35),
              Text("Colour:"),
              SizedBox(width: 25),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: selectedLine,
                items: <String>['1', '2'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newLine) {
                  setState(() {
                    selectedLine = newLine ?? '1'; // Set a default value if newLine is null
                  });
                },
              ),
              const SizedBox(width: 30),
              DropdownButton<String>(
                value: selectedColor,
                items: <String>['Blue', 'Yellow'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newCol) {
                  setState(() {
                    selectedColor = newCol ?? 'Blue'; // Set a default value if newCol is null
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: const Text("To Homescreen")),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FetchAPI()),
              );
            },
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: const Text("To Fetch Data")),
          ),
        ],
      ),
    );
  }
}