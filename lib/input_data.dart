import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputData extends StatefulWidget {
  const InputData({super.key});

  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  late String selectedColor = 'Blue'; // Default color
  late String selectedLine = '1'; // Default line

  DateTime now = DateTime.now();
  String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(DateTime.now());

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
          
          const SizedBox(height: 30),
          
          InkWell(
            onTap: () {
              // Grab Data from Dropdowns
              selectedColor;
              selectedLine;
              
              // Grab Time
              formattedDate;

              // Send
              //lingy plez
            },
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: const Text("Submit Arrival"),
            ),
          ),

          const SizedBox(height: 50),
          
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

          const SizedBox(height: 10),

          InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/fetch',
                (route) => false
              );
            },
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: const Text("Fetch Data")),
          ),
        ],
      ),
    );
  }
}