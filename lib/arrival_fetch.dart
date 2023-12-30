import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:witl/arrival.dart';

Future<List<Arrival>> fetchArrivals() async {
  try {
    // Grabbing http reponse
    final response = await http.get(Uri.parse('http://141.144.238.26:48502/arrivals/all'));

    if (response.statusCode == 200) {
      // Some JSON fuckery xd
      Iterable I = json.decode(response.body);
      List<Arrival> arrivals = List<Arrival>.from(I.map((model)=>Arrival.fromJson(model)));
      return arrivals.reversed.toList();
    } else {
      throw Exception('Failed to load Arrivals list');
    }
  } catch (error) {
    throw Exception('Failed to fetch data: $error');
  }
}
