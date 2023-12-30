import 'package:flutter/material.dart';
import 'package:witl/arrival.dart';
import 'package:witl/arrival_fetch.dart';

class FetchAPI extends StatefulWidget {
  const FetchAPI({super.key});

  @override
  State<FetchAPI> createState() => _FetchAPIState();
}

class _FetchAPIState extends State<FetchAPI> {
  late Future<List<Arrival>> fetchedArrivals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetching API"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                fetchedArrivals = fetchArrivals();
              });
            },
            icon: const Icon(Icons.refresh_sharp),
          ),
          const SizedBox(width: 30,),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                child: FutureBuilder<List<Arrival>>(
                  future: fetchedArrivals,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Failed to fetch data.\nError: ${snapshot.error}');
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("Arrival Time: ${snapshot.data![index].timeOfDay}"),
                            titleAlignment: ListTileTitleAlignment.center,
                            subtitle: Text("Week Day: ${weekNumToString(snapshot.data![index].weekDay)}"),
                            onTap: () => {
                              showArrivalInfo(context, snapshot.data![index])
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 30,),
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: const Text("Homescreen"),
              ),
            ),
            const SizedBox(height: 35,),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshData() async {
    setState(() {
      fetchedArrivals = fetchArrivals();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchedArrivals = fetchArrivals();
  }
}

String weekNumToString(int weekday) {
  switch (weekday) {
    case 1:
      return "Monday";
    case 2:
      return "Tuesday";
    case 3:
      return "Wednesday";
    case 4:
      return "Thursday";
    case 5:
      return "Friday";
    case 6:
      return "Saturday";
    case 7:
      return "Sunday";
  }

  throw "Week Day Parse Error";
}

showArrivalInfo(BuildContext context, Arrival data) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("Back"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Selected Arrival Info"),
    content: Text("Tram Colour: JSON DOESN'T HAVE COLOUR\n\nChosen Line: ${data.tramLine}\n\nDirection: ${directionParse(data.direction)}\n\nSubmitted On: ${data.timeOfDay} (Needs to include date)"),
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

String directionParse(bool direction) {
  switch (direction) {
    case true:
      return "Raml";
    case false:
      return "Victoria";
  }
}
