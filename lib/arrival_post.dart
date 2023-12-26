import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:witl/arrival.dart';

Future<Arrival> insertArrival(String date, int weekday, int line, bool direction) async {
  final response = await http.post(
    Uri.parse('http://141.144.238.26:48502/arrivals/insert'),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic> {
      'time_of_day': date,
      'week_day': weekday,
      'tram_line': line,
      'direction': direction,
    })
  );

  if (response.statusCode == 201) {
    return Arrival.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Insertion Failure.');
  }
}