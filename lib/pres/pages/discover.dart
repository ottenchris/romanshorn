import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../widgets/header.dart';
import '../widgets/highlight_slider.dart';
import '../widgets/infinity_list.dart';
import 'start.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  bool showMap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        padding: const EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 0),
        children: [
          const HeaderLogo(),
          Row(
            children: [
              InkWell(
                onTap: !showMap
                    ? null
                    : () {
                        setState(() {
                          showMap = !showMap;
                        });
                      },
                child: Text(
                  "Highlights",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: (showMap) ? Colors.grey : Colors.black),
                ),
              ),
              const VerticalDivider(thickness: 4, color: Colors.black),
              InkWell(
                onTap: showMap
                    ? null
                    : () {
                        setState(() {
                          showMap = !showMap;
                        });
                      },
                child: Text(
                  "Karte",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: (!showMap) ? Colors.grey : Colors.black),
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    showAboutDialog(
                      context: context,
                      applicationName: "Romanshorn",
                      applicationVersion: "1.0.0",
                      applicationLegalese:
                          "Als Prototyp für den HACKATHON THURGAU 2023 entstanden. Nicht voll Funktionsfähig. Die Einträge und Bilder sind nicht echt. Ähnlichkeiten mit realen Personen oder Orten sind rein zufällig.",
                    );
                  },
                  icon: const Icon(Icons.info_rounded)),
            ],
          ),
          const SizedBox(height: 32),
          if (showMap) ...[
            Card(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.60,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(47.568180, 9.371090),
                    zoom: 14.20,
                  ),
                  nonRotatedChildren: [
                    AttributionWidget.defaultWidget(
                      source: 'OpenStreetMap contributors',
                      onSourceTapped: null,
                    ),
                  ],
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (!showMap) ...[
            const HighlightSlider(),
            const SizedBox(height: 32),
            Row(
              children: [
                Text(
                  "Für Dich",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Spacer(),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const StartPage()));
                    },
                    child: const Text("Interessen ändern"))
              ],
            ),
            const InfinityList(),
            const SizedBox(height: 64),
          ]
        ],
      ),
    );
  }
}
