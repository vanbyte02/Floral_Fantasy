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
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 50, //высота
                    width: 250, //ширина
                    child: ElevatedButton(
                     style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 15, 184, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                      ),
                  ),
                  child: const Text(
                    'Перейти к оформлению',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 16, 
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
                Text(
                  '${getTotalCost()} руб.',
                  style: const TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.w700
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
