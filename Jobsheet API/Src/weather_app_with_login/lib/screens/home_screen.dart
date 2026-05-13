import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authService = AuthService();
  final _weatherService = WeatherService();
  final _searchController = TextEditingController();

  WeatherModel? _weather;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // langsung fetch cuaca via GPS saat pertama buka
    _fetchByGPS();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchByGPS() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final weather = await _weatherService.fetchWeatherByGPS();
      setState(() => _weather = weather);
    } catch (e) {
      setState(() => _errorMessage = e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _fetchByCity() async {
    final city = _searchController.text.trim();
    if (city.isEmpty) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final weather = await _weatherService.fetchWeatherByCity(city);
      setState(() => _weather = weather);
    } catch (e) {
      setState(() => _errorMessage = e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _logout() async {
    await _authService.logout();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = _authService.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2C),
        title: const Text("🌤️ Weather App",
            style: TextStyle(color: Colors.white)),
        actions: [
          // info user
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Text(
                user?.email ?? "",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ),
          // logout button
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: "Logout",
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _fetchByGPS, // refresh = fetch ulang via GPS
        color: Colors.blue,
        child: SingleChildScrollView(
          // physics wajib ditambah biar pull-to-refresh bisa trigger
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(24),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // search bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Cari kota...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFF2C2C2C),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) => _fetchByCity(),
                  ),
                ),
                const SizedBox(width: 8),
                // tombol search
                ElevatedButton(
                  onPressed: _isLoading ? null : _fetchByCity,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Icon(Icons.search, color: Colors.white),
                ),
                const SizedBox(width: 8),
                // tombol GPS
                ElevatedButton(
                  onPressed: _isLoading ? null : _fetchByGPS,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Icon(Icons.my_location, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // loading
            if (_isLoading)
              const Center(child: CircularProgressIndicator(color: Colors.blue)),

            // error
            if (_errorMessage != null && !_isLoading)
              Center(
                child: Text(_errorMessage!,
                    style: const TextStyle(color: Colors.red)),
              ),

            // weather card
            if (_weather != null && !_isLoading) ...[
              _buildWeatherCard(),
              const SizedBox(height: 24),
              _buildHourlyForecast(),
            ],
          ],
        ),
      ),
    ));
  }

  Widget _buildWeatherCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // nama kota
          Text(
            _weather!.cityName,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            _weather!.time,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 20),

          // suhu besar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${_weather!.temperature}°C",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                    fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.wb_sunny, color: Colors.amber, size: 64),
            ],
          ),
          const SizedBox(height: 8),

          // deskripsi cuaca
          Text(
            _weather!.weatherDescription,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 16),

          // info tambahan
          Row(
            children: [
              const Icon(Icons.air, color: Colors.white70, size: 16),
              const SizedBox(width: 4),
              Text(
                "Wind: ${_weather!.windspeed} km/h",
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHourlyForecast() {
    // ambil 8 jam ke depan aja
    final times = _weather!.hourlyTime.take(8).toList();
    final temps = _weather!.hourlyTemp.take(8).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Hourly Forecast",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: times.length,
            itemBuilder: (context, index) {
              // ambil jam aja dari format "2024-01-01T08:00"
              final hour = times[index].split("T").last;
              return Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2C),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(hour,
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 13)),
                    const SizedBox(height: 8),
                    const Icon(Icons.wb_sunny,
                        color: Colors.amber, size: 20),
                    const SizedBox(height: 8),
                    Text("${temps[index]}°",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}