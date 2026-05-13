class WeatherModel {
  final double temperature;
  final double windspeed;
  final int weathercode;
  final String time;
  final List<String> hourlyTime;
  final List<double> hourlyTemp;
  final String cityName;

  WeatherModel({
    required this.temperature,
    required this.windspeed,
    required this.weathercode,
    required this.time,
    required this.hourlyTime,
    required this.hourlyTemp,
    required this.cityName,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json, String city) {
    final current = json['current_weather'] as Map<String, dynamic>;
    final hourly = json['hourly'] as Map<String, dynamic>;

    return WeatherModel(
      temperature: (current['temperature'] as num).toDouble(),
      windspeed: (current['windspeed'] as num).toDouble(),
      weathercode: current['weathercode'] as int,
      time: current['time'] as String,
      hourlyTime: List<String>.from(hourly['time']),
      hourlyTemp: List<double>.from(
        (hourly['temperature_2m'] as List).map((e) => (e as num).toDouble())
      ),
      cityName: city,
    );
  }

  // konversi weathercode ke deskripsi
  String get weatherDescription {
    if (weathercode == 0) return "Clear Sky ☀️";
    if (weathercode <= 3) return "Partly Cloudy ⛅";
    if (weathercode <= 49) return "Foggy 🌫️";
    if (weathercode <= 69) return "Rainy 🌧️";
    if (weathercode <= 79) return "Snowy ❄️";
    if (weathercode <= 99) return "Thunderstorm ⛈️";
    return "Unknown";
  }
}