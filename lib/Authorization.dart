import 'package:flutter/material.dart';
import 'Home.dart';
import 'Registration.dart';



//Экран авторизации
class Authorization extends StatelessWidget {
  const Authorization ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Авторизация'),
      ),
       body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
                  width: 400,
                  height: 50,
                  child: const Center(
                      child: TextField(
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.android),
                    hintText: "Введите логин",
                    )
                  ),
                  ),
                ),
                const SizedBox(height: 40),
            Container(
                  width: 400,
                  height: 50,
                  color: Colors.white,
                  child: const Center(
                      child: TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.https),
                    hintText: "Введите пароль",
                    )
                  ),
                  ),
                ),
                const SizedBox(height: 100),
                Container(
                  width: 300,
                  height: 50, 
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                      ),
                  ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Нет аккаунта?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          )
                        ),
                        Text(' Зарегистрироваться!', 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          )
                          ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Registration()
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                    Container(
                      width: 300,
                      height: 50, 
              child: ElevatedButton(
                style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                      ),
                  ),
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                    fontSize: 18, 
                    color: Colors.black
                   ),
                   ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()
               ),
                );
              },
            ),
              ),
            const SizedBox(height: 30),
          ]
        ),
      ),
    );
  }
} 