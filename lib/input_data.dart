import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:witl/arrival_post.dart';

class InputData extends StatefulWidget {
  const InputData({super.key});

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  late String selectedColor = 'Blue'; // Default color
  late int selectedLine = 1; // Default line
  late String selectedDirection = 'Raml'; // Default Station Direction

  // Date and Time Info, FULLY
  DateTime now = DateTime.now();

  // What will be displayed to the user
  String userFormattedString = DateFormat('kk:mm EEE dd MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Naming the screen
        title: const Text("Arrivals Input"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Choose Tram Line and Colour"),

          const SizedBox(height: 15),

          // Prompt Row
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Line:"),

              SizedBox(width: 35),
              
              Text("Colour:"),
              
              SizedBox(width: 25),
            ],
          ),

          // Checkbox Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<int>(
                value: selectedLine,
                
                items: <int>[1, 2].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                
                onChanged: (int? newLine) {
                  setState(() {
                    selectedLine = newLine ?? 1; // Set a default value if newLine is null
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

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Text("Direction:"),
              SizedBox(width: 20),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              DropdownButton<String>(
                value: selectedDirection,
                
                items: <String>['Raml', 'Victoria'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                
                onChanged: (String? newEnd) {
                  setState(() {
                    selectedDirection = newEnd ?? 'Victoria'; // Set a default value if newLine is null
                  });
                },
              ),
            ],
          ),
          
          const SizedBox(height: 30),
          
          InkWell(
            hoverDuration: const Duration(milliseconds: 450),
            hoverColor: (selectedColor == "Blue") ? Colors.blue[500] : Colors.yellow[700],
            borderRadius: BorderRadius.circular(30),
            splashColor: (selectedColor == "Blue") ? Colors.blue[800] : Colors.yellow[700],
            onTap: () {
              // Grab Data from Dropdowns
              selectedColor; //

              if (selectedColor == 'Yellow') {
                selectedLine += 2;
              }

              // Conforming by db standard of boolean
              bool payloadDirection;

              if (selectedDirection == 'Raml') {
                payloadDirection = true;
              } else {
                payloadDirection = false;
              }
              
              // Grab Time
              now.weekday; // Day    (1 ->  7) !! Starts Monday !!
              now.hour;    // Hour   (0 -> 23)
              now.minute;  // Minute (0 -> 59)
              now.second;  // Second (0 -> 59)

              // Send
              //lingy plez
              insertArrival('${now.hour}:${now.minute}:${now.second}', now.weekday, selectedLine, payloadDirection);

              //prompting of submission
              showAlertDialog(context, selectedLine, selectedColor, selectedDirection, userFormattedString);
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

showAlertDialog(BuildContext context, int chosenLine, String chosenColour, String chosenDir, String submissionDate) {

  // Delay (I want the splash to show)
  //Future.delayed(const Duration(milliseconds: 200));

  // set up the button
  Widget okButton = TextButton(
    child: const Text("Pogchamp"),
    onPressed: () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/',
        (route) => false);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Submitted Info"),
    content: Text("Tram Colour: $chosenColour\n\nChosen Line: $chosenLine\n\nDirection: $chosenDir\n\nSubmitted On: $submissionDate"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}