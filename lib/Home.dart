import 'package:flutter/material.dart';
import 'Cart.dart';
import 'Like.dart';
import 'modul/DataBase.dart';
import 'Flowers.dart';




//Главный экран магазина
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Flowers> cart = [];
  List<Flowers> like = [];
  

  void toggleCart(Flowers flower) {
    setState(() {
      if (cart.contains(flower)) {
        cart.remove(flower);
      } else {
        cart.add(flower);
      }
    });
  }

  void toggleLike(Flowers flower) {
    setState(() {
      if (like.contains(flower)) {
        like.remove(flower);
      } else {
        like.add(flower);
      }
    });
  }

  
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
          mainAxisSpacing: 25,
          crossAxisSpacing: 25,
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
                    //video: flowersList[index].video,
                    fimage: fimageList[index].fimage,
                  ),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Image.network(
                  flowersList[index].image,
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
                  flowersList[index].price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                children: <Widget>[
                  const SizedBox(width: 10),
                  Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: IconButton(
                      icon: const Icon(
                        Icons.local_grocery_store,
                        size: 20,
                        color: Colors.black,
                      ),
                       onPressed: () => toggleCart(flowersList[index]),
                    ),
                  ),
                  ),
                  Center(
                  child: Container(
                     width: 50,
                    height: 50,
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 20,
                        color: Colors.red,
                      ),
                      onPressed: () => toggleLike(flowersList[index]),
                    ),
                  ),
                  ),
                ],
                )
              ],
            ),
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
                Icons.local_grocery_store
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
                Icons.home
                ),
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













 