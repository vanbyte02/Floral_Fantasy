import 'package:flutter/material.dart';
import 'package:flutter_application_2/Authorization.dart';



//Экран регистрации
class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Регистрация'),
        ),
      ),
      body: Center(
          child: Column(
            children: <Widget>[ 
              const SizedBox(height: 100),
              Container(
                  width: 400,
                  height: 50,
                  color: Colors.white,
                  child: const Center(
                      child: TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.android),
                    hintText: "Введите логин",
                    )
                  ),
                  ),
                ),
                const SizedBox(height: 45),
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
              const SizedBox(height: 45),
             Container(
                  width: 400,
                  height: 50,
                  color: Colors.white,
                  child: const Center(
                    child: TextField(decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.local_post_office),
                        hintText: "Введите почту",
                        fillColor: Colors.white,
                        filled: true
                    )
                    ),
                  ),
                ),
                const SizedBox(height: 45),
              Container(
                  width: 400,
                  height: 50,
                  color: Colors.white,
                  child: const Center(
                    child: TextField(decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.phone),
                        hintText: "Введите номер телефона",
                        fillColor: Colors.white,
                        filled: true
                    )
                    ),
                  ),
                ),
                const SizedBox(height: 45),
              Container(
                   width: 300,
                  height: 70,   
              child: ElevatedButton(
               onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Authorization()
                        ),
                      );
                    },
                child: const Text('Зарегистрироваться',
                    style: TextStyle(
                        fontSize: 18, 
                        color: Colors.black
                      ),
                    ),
                ),
              ),
              const SizedBox(height: 35),
            ],
          )
      ),
    );
  }
}