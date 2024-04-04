import 'package:flutter/material.dart';
import 'До входа/Home1.dart';
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
        useMaterial3: true,
      ),
      home: const Home1(),
    );
  }
}