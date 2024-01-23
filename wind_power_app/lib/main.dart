import 'package:flutter/material.dart';
import 'package:wind_power_app/locator.dart';
import 'package:wind_power_app/views/chart_view.dart';

void main() async {
  setupLocator();
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
      home: const ChartView(),
    );
  }
}
