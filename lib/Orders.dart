import 'package:flutter/material.dart';
import 'modul/DataBase.dart';
import 'Home.dart';
import 'Like.dart';
import 'Cart.dart';
import 'PersonalAccount.dart';



class OrderDetailsScreen extends StatelessWidget {
  final int orderIndex; 

  const OrderDetailsScreen({Key? key, required this.orderIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Orders order = orders[orderIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали заказа'),
      ),
      body: ListView.builder(
        itemCount: order.flowers.length,
        itemBuilder: (context, index) {
          final flower = order.flowers[index];
          return ListTile(
            leading: Image.network(flower.fimage[0]), 
            title: Text(flower.name),
            subtitle: Text('Количество: ${flower.quantity}, Цена: ${flower.price}, Стоимость: ${flower.quantity * flower.price} Руб'),
          );
        },
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
                  Icons.person,//Личный кабинет
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