
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

Future<FetchAlbum> fetchArrivals() async {
  final response = await http
      .get(Uri.parse(DB_URL));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return FetchAlbum.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class FetchAlbum {
  final String timeOfDay;
  final int weekDay;
  final String tramLine;
  final bool direction;

  const FetchAlbum({
    required this.timeOfDay,
    required this.weekDay,
    required this.tramLine,
    required this.direction,
  });

  factory FetchAlbum.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'time_of_day': String jsonTime,
        'week_day': int jsonDay,
        'tram_line': String jsonTramLine,
        'direction': bool jsonDirec,
      } =>
        FetchAlbum(
          // Class : json declaration
          timeOfDay: jsonTime,
          weekDay: jsonDay,
          tramLine: jsonTramLine,
          direction: jsonDirec,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
