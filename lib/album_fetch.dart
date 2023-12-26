import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

Future<List<Arrival>> fetchArrivals() async {
  final response = await http
      .get(Uri.parse('http://141.144.238.26:48502/arrivals/all'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> data = jsonDecode(response.body);
    List<Arrival> posts = List<Arrival>.from(data.map((dynamic postJson) {
      return Arrival.fromJson(postJson);
    }));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Arrival');
  }

  throw Exception("API Unavailable");
}

class Arrival {
  final String timeOfDay;
  final int weekDay;
  final int tramLine;
  final bool direction;

  const Arrival({
    required this.timeOfDay,
    required this.weekDay,
    required this.tramLine,
    required this.direction,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'time_of_day': String jsonTime,
        'week_day': int jsonDay,
        'tram_line': int jsonTramLine,
        'direction': bool jsonDirec,
      } =>
        Arrival(
          // Class : json declaration
          timeOfDay: jsonTime,
          weekDay: jsonDay,
          tramLine: jsonTramLine,
          direction: jsonDirec,
        ),
      _ => throw const FormatException('Failed to load Arrival.'),
    };
  }
}
