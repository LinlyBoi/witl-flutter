import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:witl/arrival.dart';

Future<List<Arrival>> fetchArrivals() async {
  try {
    final response = await http.get(Uri.parse('http://141.144.238.26:48502/arrivals/all'));

    if (response.statusCode == 200) {
      // List<dynamic> data = jsonDecode(response.body);
      // List<Arrival> arrivals = List<Arrival>.from(data.map((dynamic arrivalJson) {
      //   return Arrival.fromJson(arrivalJson);
      // }));
      Iterable I = json.decode(response.body);
      List<Arrival> arrivals = List<Arrival>.from(I.map((model)=>Arrival.fromJson(model)));
      return arrivals;
    } else {
      throw Exception('Failed to load Arrival');
    }
  } catch (error) {
    throw Exception('Failed to fetch data: $error');
  }
}
