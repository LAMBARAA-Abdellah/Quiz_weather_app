import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> weatherData = [
      {"date": "Fri 27 Jun 22:00", "desc": "scattered clouds 19°C"},
      {"date": "Sat 28 Jun 01:00", "desc": "broken clouds 20°C"},
      {"date": "Sat 28 Jun 04:00", "desc": "clear sky 21°C"},
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "City",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: const Text("Get Weather")),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: weatherData.map((item) {
                return Card(
                  color: Colors.orange,
                  child: ListTile(
                    leading: const Icon(Icons.cloud),
                    title: Text(item["date"]!),
                    subtitle: Text(item["desc"]!),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
