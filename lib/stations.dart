class TramStation {
  final String name;
  final String city;
  final double latitude;
  final double longitude;

  TramStation({
    required this.name,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  factory TramStation.fromJson(Map<String, dynamic> json) {
    return TramStation(
      name: json['name'] as String,
      city: json['city'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }
}