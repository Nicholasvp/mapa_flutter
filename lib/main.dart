import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    MapController mapController = MapController();
    return Scaffold(
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(28.518736, -81.364704),
          initialZoom: 8,
        ),
        mapController: mapController,
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          const MarkerLayer(
            markers: [
              Marker(
                point: LatLng(28.518736, -81.364704),
                width: 80,
                height: 80,
                child: Icon(Icons.location_on),
              ),
              Marker(
                point: LatLng(25.769779, -80.212464),
                width: 80,
                height: 80,
                child: Icon(Icons.location_on),
              ),
              Marker(
                point: LatLng(26.122437, -80.140567),
                width: 80,
                height: 80,
                child: Icon(Icons.location_on),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                mapController.move(
                  const LatLng(28.518736, -81.364704),
                  8,
                );
              },
              icon: const Icon(Icons.house),
            ),
            IconButton(
              onPressed: () {
                mapController.move(const LatLng(25.769779, -80.212464), 8);
              },
              icon: const Icon(Icons.beach_access),
            ),
            IconButton(
              onPressed: () {
                mapController.move(const LatLng(26.122437, -80.140567), 8);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
    );
  }
}
