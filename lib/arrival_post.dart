import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:witl/arrival.dart';

Future<Arrival> insertArrival(String date, int weekday, int line, bool direction) async {
  final client = http.Client();

  try {
    // POST response as JSON
    final response = await client.post(
      Uri.parse('http://141.144.238.26:48502/arrivals/insert'),
      headers: <String, String> {
        // Headers used
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // Encoding a singular json entry
      body: jsonEncode(<String, dynamic> {
        'time_of_day': date,
        'week_day': weekday,
        'tram_line': line,
        'direction': direction,
      })
    ).timeout(const Duration(seconds: 10));

    if (response.statusCode == 201) {
      return Arrival.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Insertion Failure.');
    }
  } catch (error) {
    throw Exception("Error Posting: $error");
  } finally {
    client.close();
  }
}