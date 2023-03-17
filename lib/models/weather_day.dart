class WeatherDay {
  final String fecha;
  final double temp_min;
  final double temp_max;
  final String description;

  WeatherDay(
      {required this.fecha,
      required this.temp_min,
      required this.temp_max,
      required this.description});

  factory WeatherDay.fromJson(Map<String, dynamic> json) => WeatherDay(
        fecha: json["list"][0]["dt_txt"],
        temp_min: json["list"][0]["main"]["temp_min"],
        temp_max: json["list"][0]["main"]["temp_max"],
        description: json["list"][0]["weather"][0]["description"],
      );

  Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "temp_min": temp_min,
        "temp_max": temp_max,
        "description": description,
      };
}
