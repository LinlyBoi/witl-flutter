import 'package:flutter/material.dart';
import 'package:witl/album_fetch.dart';

class FetchAPI extends StatefulWidget {
  const FetchAPI({super.key});

  @override
  State<FetchAPI> createState() => _FetchAPIState();
}

class _FetchAPIState extends State<FetchAPI> {
  late Future<FetchAlbum> fetchedAlbum;

  @override
  void initState() {
    super.initState();
    fetchedAlbum = fetchArrivals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetching API"),
      ),
      body: ListView(
        children: [
          FutureBuilder<FetchAlbum> (
            future: fetchedAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.timeOfDay);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const  CircularProgressIndicator();
            },
          ),
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
        ],
      ),
    );
  }
}