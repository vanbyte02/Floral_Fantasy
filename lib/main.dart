import 'package:flutter/material.dart';



  class flowers {
  final String name;
  final String image;
  final String price;

  flowers(this.name,this.image, this.price);
}

List<flowers> flowersList = [
  flowers("Роза Кордана микс 10,5x10,5 см", 'https://cdn.leroymerlin.ru/lmru/image/upload/f_auto/q_auto/dpr_2.0/c_pad/w_1000/h_1000/v1603870660/lmcode/bep5XXKqUEOvjuSJeUPA6g/82895031.png', "404 Руб."),
  flowers("Бегония «Элатиор» 15х35 см", 'https://cdn.leroymerlin.ru/lmru/image/upload/f_auto/q_auto/dpr_2.0/c_pad/w_1000/h_1000/v1590036556/lmcode/A7Ov8uGnY0itMHFUglb_Jg/12510729.png', "498 Руб."),
  flowers("Хризантема микс 9х22см", 'https://cdn.leroymerlin.ru/lmru/image/upload/f_auto/q_auto/dpr_2.0/c_pad/w_1000/h_1000/v1545755387/lmcode/bRRorikIsU6PT2hkY0aZvg/13974234.jpg', "298 Руб."),
  flowers("Примула микс 11x15 см", 'https://cdn.leroymerlin.ru/lmru/image/upload/f_auto/q_auto/dpr_2.0/c_pad/w_1000/h_1000/v1583504406/lmcode/3BPMymuyZkmHdaboJ-4kMA/82560402.png', "161 Руб."),
  flowers("Спатифиллум Чопин 9х30 см", 'https://cdn.leroymerlin.ru/lmru/image/upload/f_auto/q_auto/dpr_2.0/c_pad/w_1000/h_1000/v1562082600/lmcode/8AwArk6pHkiUZr9Dctqo7g/14032601.png', "522 Руб."),
  flowers("Спатифиллум Чопин 9х30 см", 'https://cdn.leroymerlin.ru/lmru/image/upload/f_auto/q_auto/dpr_2.0/c_pad/w_1000/h_1000/v1562082600/lmcode/8AwArk6pHkiUZr9Dctqo7g/14032601.png', "522 Руб.")
];


//Главная функция
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
      home: const HomeRoute (),
    );
  }
}


//Экран авторизации
class AuthorizationRoute extends StatelessWidget {
  const AuthorizationRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Авторизация'),
        ),
      ),
       body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
            child:Container(
                  width: 400,
                  height: 10,
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
              ),
          Expanded(
            flex: 3,
            child:Container(
                  width: 400,
                  height: 10,
                  color: Colors.white,
                  child: const Center(
                      child: TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.https),
                    hintText: "Пароль",
                    )
                  ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 400,
                  height: 20, 
           child: ElevatedButton(
              child: const Text('Нет аккаунта? Зарегистрироваться!'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistrationRoute()
                  ),
                );
              },
            ),
                ),
            ),
            const SizedBox(height: 40),
            Expanded(
              flex: 1,
              child: SizedBox(
                  width: 400,
                  height: 20, 
           child: ElevatedButton(
              child: const Text('Войти'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeRoute()
                  ),
                );
              },
            ),
              ),
            ),
            const SizedBox(height: 30),
          ]
        ),
      ),
    );
  }
}

//Экран регистрации
class RegistrationRoute extends StatelessWidget {
  const RegistrationRoute({super.key});

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
              Expanded(
                flex: 2,
            child:Container(
                  width: 400,
                  height: 10,
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
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 2,
            child:Container(
                  width: 400,
                  height: 10,
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
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 2,
                child: Container(
                  width: 400,
                  height: 10,
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
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 2,
                child:Container(
                  width: 400,
                  height: 10,
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
              ),
              Expanded(
                child: SizedBox(
                  width: 400,
                  height: 20,  
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Зарегистрироваться'
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


//Главный экран магазина
class HomeRoute extends StatelessWidget {
  const HomeRoute({super. key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Floral Fantasy'),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemCount: flowersList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
                horizontal:20,
                vertical:10,
              ),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                 color: const Color.fromARGB(255, 213, 214, 213),
              ),
            width: 100,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Expanded(
                child: Image.network(
                  flowersList[index].image,
                  height: 200,
                  width: 200,
                ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  flowersList[index].name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  flowersList[index].price,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}