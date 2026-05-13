import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../models/weather_model.dart';

class WeatherService {
  final Dio _dio = Dio();

  // fetch cuaca berdasarkan koordinat
  Future<WeatherModel> fetchWeather(double lat, double lon, String cityName) async {
    try {
      final response = await _dio.get(
        "https://api.open-meteo.com/v1/forecast",
        queryParameters: {
          "latitude": lat,
          "longitude": lon,
          "current_weather": true,
          "hourly": "temperature_2m",
          "forecast_days": 1,
        },
      );
      return WeatherModel.fromJson(response.data, cityName);
    } catch (e) {
      throw "Gagal mengambil data cuaca";
    }
  }

  // fetch cuaca berdasarkan nama kota
  Future<WeatherModel> fetchWeatherByCity(String cityName) async {
    try {
      // konversi nama kota ke koordinat
      List<Location> locations = await locationFromAddress(cityName);
      if (locations.isEmpty) throw "Kota tidak ditemukan";

      final lat = locations.first.latitude;
      final lon = locations.first.longitude;

      return fetchWeather(lat, lon, cityName);
    } catch (e) {
      throw "Kota tidak ditemukan, coba nama lain";
    }
  }

  // fetch cuaca berdasarkan GPS
  Future<WeatherModel> fetchWeatherByGPS() async {
    try {
      // cek permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw "Izin lokasi ditolak";
        }
      }
      if (permission == LocationPermission.deniedForever) {
        throw "Izin lokasi diblokir permanen, aktifkan di settings";
      }

      // ambil posisi
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      );

      // konversi koordinat ke nama kota
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final city = placemarks.first.locality ?? 
                   placemarks.first.subAdministrativeArea ?? 
                   "Current Location";

      return fetchWeather(position.latitude, position.longitude, city);
    } catch (e) {
      throw e.toString();
    }
  }
}