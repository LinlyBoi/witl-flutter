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
      // Key value
      // <field>: json['<field_name_in_json>'] as <data_type>
      // Arrival Time
      timeOfDay: json['time_of_day'] as String,
      
      // Day 1 -> 7 !! Starting from Monday !!
      weekDay: json['week_day'] as int,
      
      // Line 1 or 2
      tramLine: json['tram_line'] as int,

      // True -> Raml, False -> Victoria
      direction: json['direction'] as bool,
    );
  }
}
