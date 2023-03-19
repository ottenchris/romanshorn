import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:romanshorn/pres/pages/start.dart';

import '../widgets/header.dart';
import '../widgets/highlight_slider.dart';
import '../widgets/infinity_list.dart';

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
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: (!showMap) ? Colors.grey : Colors.black),
                  )),
            ],
          ),
          const SizedBox(height: 32),
          if (showMap) ...[
            Card(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.60,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(47.5658600, 9.3786900),
                    zoom: 13.5,
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
                      primary: Colors.black,
                      side: const BorderSide(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => StartPage()));
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
