import 'package:flutter/material.dart';
import 'modul/DataBase.dart';
import 'Home.dart';

class CartPage extends StatelessWidget {
  final List<Flowers> cartItems;

  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(cartItems[index].image, width: 50, height: 50),
            title: Text(cartItems[index].name),
            subtitle: Text(cartItems[index].price),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()
               ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.local_grocery_store),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()
               ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()
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