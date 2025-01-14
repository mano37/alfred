import 'package:alfred/core/config/environment.dart';
import 'package:flutter/material.dart';
import 'package:alfred/app/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alfred',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
      debugShowCheckedModeBanner: AppConfig.environment != 'prod',
    );
  }
}
