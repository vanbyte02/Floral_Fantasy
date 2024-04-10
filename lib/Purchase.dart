import 'package:flutter/material.dart';
import 'modul/DataBase.dart';
import 'Home.dart';
import 'Like.dart';
import 'Cart.dart';
import 'PersonalAccount.dart';

// Экран оформления заказа
class Purchase extends StatefulWidget {
  const Purchase({super.key});

  @override
  _PurchaseState createState() => _PurchaseState();
}


class _PurchaseState extends State<Purchase> {

  
  final List<String> pay = [
    'Оплата через СБП',
    'Оплата наличными при получении',
    'Оплата картой при получении',
    'Оплата онлайн картой',
  ];

  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Оформление заказа'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromARGB(255, 230, 230, 230),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const TextField(
                decoration:  InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Введите ваш адрес',
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromARGB(255, 230, 230, 230),
              ),
              child: DropdownButton<String>(
                value: _selectedPaymentMethod,
                hint: const Text('Выберите способ оплаты'),
                isExpanded: true,
                underline: Container(), 
                items: pay.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPaymentMethod = newValue;
                  });
                },
              ),
            ),
            const SizedBox(height: 120),
            SizedBox(
                    height: 50, //высота
                    width: 270, //ширина
                    child: ElevatedButton(
                     style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 15, 184, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                      ),
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
                DateTime.now();
                orders.addAll(cart); 
                cart.clear(); 
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Заказ успешно оформлен!'), duration: Duration(seconds: 2)),
                );
              },
              )
            ),
          ],
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