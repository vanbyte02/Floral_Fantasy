import 'package:flutter/material.dart';
//import 'package:flutter_application_2/%D0%94%D0%BE%20%D0%B2%D1%85%D0%BE%D0%B4%D0%B0/Home1.dart';
import 'Home.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor:const  Color.fromARGB(255, 255, 255, 255)),
      ),
      home: const Home(),
    );
  }
}