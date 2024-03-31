import 'package:flutter/material.dart';
import 'Home.dart';
import 'modul/DataBase.dart';
import 'Like.dart';
import 'Cart.dart';
import 'PersonalAccount.dart';

//Экран оформления заказа
class Purchase extends StatelessWidget {
  const Purchase ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Оформление заказа'),
        ),
      ),
       body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
                const SizedBox(height: 40),
                Container(
              width: 370,
              height: 70, 
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 15, 184, 0), 
                ),
                child: const Text(
                  'Заказать',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18, 
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  purchase.clear();

                  purchase.addAll(cart);

                  cart.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Заказ оформлен'),
                      duration: Duration(seconds: 2),
                    ),
                  );    
                }
              )
                ),
          
          ]
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.local_grocery_store,//Корзина
                  color: Colors.black,
                  size: 25,
                  ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage(cartItems: cart)
                ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite_border,//Избранное
                  color: Colors.red,
                  size: 25,
                  ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LikePage(likeItems: like)
                ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.home,//Гл.Экран
                  color: Colors.black,
                  size: 25,
                  ),
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()
                          ),
                        );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.android,//Личный кабинет
                  color: Colors.green,
                  size: 25,
                  ),
                onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Account()
                          ),
                        );
                      },
              ),
            ],
          ),
        ),
    );
  }
} 