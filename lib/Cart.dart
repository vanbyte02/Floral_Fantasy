import 'package:flutter/material.dart';
import 'Purchase.dart';
import 'modul/DataBase.dart';
import 'Like.dart';
import 'PersonalAccount.dart';

//Экран Корзины
class CartPage extends StatefulWidget {
  final List<Flowers> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  int getTotalCost() {
    int totalCost = 0;
    for (var item in widget.cartItems) {
      totalCost += item.price;
    }
    return totalCost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Корзина'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    setState(() {
                      cart.removeAt(index);
                    });
                  },
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    leading: Image.network(
                      widget.cartItems[index].fimage[0], 
                      width: 50, 
                      height: 50
                      ),
                    title: Text(
                      style: const TextStyle(
                        fontSize: 18, 
                      fontWeight: FontWeight.w600
                      ),
                      widget.cartItems[index].name,
                    ),
                    subtitle: Text(
                      style: const TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.w400
                        ),
                      '${widget.cartItems[index].price} Руб',
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Общая стоимость:',
                  style: TextStyle(
                  fontSize: 17, 
                  fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '${getTotalCost()} Руб',
                  style: const TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.w400
                    ),
                ),
                const SizedBox(height: 20),
                Container(
                    height: 50, //высота
                    width: 400, //ширина
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 15, 184, 0), 
                     ),
                  child: const Text(
                    'Оформить заказ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 15, 
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                   ),
                   ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Purchase()
               ),
                );
              },
            ),
            ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
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
              onPressed: () {},
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
                Navigator.pop(context);
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
