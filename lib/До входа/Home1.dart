import 'package:flutter/material.dart';
import 'package:flutter_application_2/Authorization.dart';
import '../Cart.dart';
import '../Like.dart';
import '../modul/DataBase.dart';
import '../Flowers.dart';




//Главный экран магазина
class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  _HomeState1 createState() => _HomeState1();
}

class _HomeState1 extends State<Home1> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Floral Fantasy'),
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
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 7,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionFlovers(
                    name: flowersList[index].name,
                    price: flowersList[index].price,
                    description: flowersList[index].description,
                    specifications: flowersList[index].specifications,
                    id: flowersList[index].id,
                    //video: flowersList[index].video,
                    fimage: flowersList[index].fimage,
                  ),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Image.network(
                  flowersList[index].fimage[0],
                  height: 75,
                  width: 75,
                  ),
                const SizedBox(height: 5),
                Text(
                  textAlign: TextAlign.center,
                  flowersList[index].name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  textAlign: TextAlign.center,
                  '${flowersList[index].price} Руб',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                ],
                )
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
                Icons.local_grocery_store,
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
                Icons.favorite_border,
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
                Icons.home,
                color: Colors.black,
                size: 25,
                ),
              onPressed: () {},
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
                        MaterialPageRoute(builder: (context) => const Authorization()
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
