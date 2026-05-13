class WeatherModel {
  WeatherModel({
    required this.currentWeather,
    required this.hourly
  });
  final currentWeather;
  final hourly;

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    final currentWeather = data['current_weather'] as Map<String, dynamic>? ?? {};
    final hourly = data['hourly'] as Map<String, dynamic>? ?? {};
    return WeatherModel(currentWeather: currentWeather, hourly: hourly);
  }
}

class currentWeather {
  currentWeather({
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.weathercode,
    required this.time
  });
  final temperature;
  final windspeed;
  final winddirection;
  final weathercode;
  final time;

  factory currentWeather.fromJson(Map<String, dynamic> data) {
    final temperature = data['temperature'] as double;
    final windspeed = data['windspeed'] as double;
    final winddirection = data['winddirection'] as double;
    final weathercode = data['weathercode'] as int;
    final time = data['time'] as String;
    return currentWeather(temperature: temperature, windspeed: windspeed, winddirection: winddirection, weathercode: weathercode, time: time
    );
  }
}

class hourly {
  hourly({
    required this.time,
    required this.temperature2m
  });
  final time;
  final temperature2m;

  factory hourly.fromJson(Map<String, dynamic> data) {
    final time = data['time'] as List<dynamic>;
    final temperature2m = data['temperature_2m'] as List<dynamic>;
    return hourly(time: time, temperature2m: temperature2m
    );
  }
}