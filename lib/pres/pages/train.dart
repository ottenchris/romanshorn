import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:romanshorn/pres/widgets/header.dart';

class Train extends StatefulWidget {
  const Train({Key? key}) : super(key: key);

  @override
  State<Train> createState() => _TrainState();
}

class _TrainState extends State<Train> {
  TextEditingController trainCtrl = TextEditingController();

  List<dynamic> _connections = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    //_fetchConnectionsFromApi("Zurich");
    //trainCtrl.text = "Zurich";
  }

  Future<void> _fetchConnectionsFromApi(String destination) async {
    final url =
        'http://transport.opendata.ch/v1/connections?from=Romanshorn&to=$destination';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final connections = jsonResponse['connections'];
      setState(() {
        _isLoading = false;
        _connections = connections;
      });
    } else {
      throw Exception('Failed to load connections');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          children: [
            const HeaderLogo(),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: trainCtrl,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusColor: Colors.blue,
                  hintText: 'Zielbahnhof',
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                ),
                onSubmitted: (String destination) {
                  setState(() {
                    _isLoading = true;
                  });
                  _fetchConnectionsFromApi(destination);
                },
              ),
            ),
            (trainCtrl.text.isEmpty)
                ? const Card(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Bitte Zielbahnhof eingeben",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16)),
                    ),
                  )
                : _isLoading
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : (_connections.isEmpty && !_isLoading)
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: Text("Keine Ergebnisse gefunden"),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _connections.length,
                            itemBuilder: (BuildContext context, int index) {
                              final connection = _connections[index];
                              final departure = connection['from']['departure'];
                              final arrival = connection['to']['arrival'];
                              final duration = connection['duration'];
                              return ListTile(
                                leading: const Icon(Icons.train),
                                title: Text(
                                    'Departure: ${departure.substring(11, 16)} - Arrival: ${arrival.substring(11, 16)}'),
                                subtitle: Text('Duration: $duration minutes'),
                              );
                            },
                          ),
          ]),
    );
  }
}
