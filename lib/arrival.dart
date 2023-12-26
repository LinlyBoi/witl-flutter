class Arrival {
  final String timeOfDay;
  final int weekDay;
  final int tramLine;
  final bool direction;

  Arrival({
    required this.timeOfDay,
    required this.weekDay,
    required this.tramLine,
    required this.direction,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) {
    return Arrival(
      timeOfDay: json['time_of_day'] as String,
      weekDay: json['week_day'] as int,
      tramLine: json['tram_line'] as int,
      direction: json['direction'] as bool,
    );
  }
}
