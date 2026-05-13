import 'package:belajar_weather_app/client.dart';
import 'package:belajar_weather_app/model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WeatherApp());
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  WeatherModel? weather;
  List<dynamic>? hourly_temp;
  List<dynamic>? hourly_date;
  List<Widget>? hourly;
  List<Widget>? hourly_cast_date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Current Weather", 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 32, 
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20
              ),
              Icon(
                Icons.wb_sunny, 
                color: Colors.amber, 
                size: 64
              ),
              SizedBox(
                height: 20
              ),
              Text(
                weather != null ? "${weather!.currentWeather["temperature"] != null ?weather?.currentWeather["temperature"]: 0}°C" : "No data",
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 32, 
                  fontWeight: FontWeight.bold
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  print("test");
                  weather = await WeatherApiClient().request();
                  print(weather?.currentWeather);
                  hourly_temp = weather?.hourly["temperature_2m"];
                  hourly_date = weather?.hourly["time"];
                  hourly = hourly_temp?.map((e) => Padding(padding:   EdgeInsets.all(16.0),
                    child: Text("$e", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ))
                  .toList();
                  hourly_cast_date = hourly_date?.map((e) => Padding(padding:   EdgeInsets.all(16.0),
                    child: Text("$e", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ))
                  .toList();
                  setState(() {
                    
                  });
                },
                child: Text("Get Weather Data"),
              ),
              Container(
                margin: EdgeInsets.all(22),
                color: const Color.fromARGB(255, 66, 66, 66),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: hourly_cast_date == null ? [Text("No data")] : hourly_cast_date!,
                    ),
                    Column(
                      children: hourly == null ? [Text("No data")] : hourly!,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
