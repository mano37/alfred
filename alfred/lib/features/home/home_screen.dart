import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:alfred/core/config/environment.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String responseMessage = "Press the button";

  Future<void> fetchGreeting() async {
    final String backendUrl = '${AppConfig.apiBaseUrl}/api/greet?name=Flutter';

    try {
      final response = await http.get(Uri.parse(backendUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          responseMessage = data['message'];
        });
      } else {
        setState(() {
          responseMessage = 'Failed to fetch data: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        responseMessage = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Flask')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$responseMessage test', textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchGreeting,
              child: Text('Fetch Greeting'),
            ),
          ],
        ),
      ),
    );
  }
}
