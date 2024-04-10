import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'modul/DataBase.dart';
import 'Home.dart';
import 'Like.dart';
import 'Cart.dart';
import 'PersonalAccount.dart';
import 'Orders.dart';

class HistoryPurchase extends StatefulWidget {
  const HistoryPurchase({Key? key}) : super(key: key);

  @override
  _HistoryPurchaseState createState() => _HistoryPurchaseState();
}

class _HistoryPurchaseState extends State<HistoryPurchase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('История покупок'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          String formattedDate = DateFormat('dd.MM.yyyy').format(order.date); 
          return ListTile(
            title: Text('Заказ от $formattedDate',
            style: const TextStyle(
                fontSize: 18, 
                color: Colors.black,
                fontWeight: FontWeight.w600
                ),
                ),
            onTap: () {
        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => OrderDetailsScreen(orderIndex: index)),
  );

      },

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
                     MaterialPageRoute(builder: (context) => const Home(
                      )
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