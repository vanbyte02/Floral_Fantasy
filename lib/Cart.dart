import 'package:flutter/material.dart';
import 'package:flutter_application_2/Home.dart';
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
      totalCost += item.price * item.quantity;
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
        final item = widget.cartItems[index];
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {
            setState(() {
              widget.cartItems.removeAt(index);
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
              item.fimage[0], 
              width: 50, 
              height: 50
            ),
            title: Text(
              item.name,
              style: const TextStyle(
                fontSize: 16,
               fontWeight: FontWeight.w600),
            ),
            subtitle: Row(
              children: <Widget>[
                   Text('${item.price * item.quantity} Руб',
                style: const TextStyle(
                    fontSize: 15, 
                    color: Colors.black,
                    fontWeight: FontWeight.w400
                    ),
                   ),
                   const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (item.quantity > 1) {
                        item.quantity--;
                      }
                    });
                  },
                ),
                Text('${item.quantity}',
                style: const TextStyle(
                    fontSize: 15, 
                    color: Colors.black,
                    fontWeight: FontWeight.w400
                    ),
                   ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      item.quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 40, //высота
                    width: 235, //ширина
                    child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
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
                    fontWeight: FontWeight.w600
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
                    fontSize: 17, 
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
