import 'package:flutter/material.dart';
import 'package:witl/album_fetch.dart';

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
      ),
      body: Row(
        children: <Widget>[
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
                          title: Text(snapshot.data![index].timeOfDay),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: const Text("Homescreen"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchedArrivals = fetchArrivals();
  }
}
