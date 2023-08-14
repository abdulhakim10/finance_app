import 'package:finance_app/Screens/statistics.dart';
import 'package:finance_app/home.dart';
import 'package:finance_app/widgets/chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Statistics(),
    );
  }
}
