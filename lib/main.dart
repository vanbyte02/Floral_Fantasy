import 'package:flutter/material.dart';
import 'package:flutter_application_2/Before_login/Home1.dart';
import 'package:flutter_application_2/Home.dart';

void main() {
  runApp(const MyApp());
}

//Запук приложения
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Цветочный магазин "Floral Fantasy"',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const Home1(),
    );
  }
}