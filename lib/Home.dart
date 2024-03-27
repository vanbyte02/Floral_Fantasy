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
  Set<int> likedIndexes = Set();
  Set<int> cartIndexes = Set();
  

  void addCart(int index) { 
    setState(() {
      if (cartIndexes.contains(index)) {
        cartIndexes.remove(index);
        CartLike.cart.remove(flowersList[index]);
      } else {
        cartIndexes.add(index);
        CartLike.cart.add(flowersList[index]);
      }
    });
  }

  void addLike(int index) { 
    setState(() {
      if (likedIndexes.contains(index)) {
        likedIndexes.remove(index);
        CartLike.like.remove(flowersList[index]);
      } else {
        likedIndexes.add(index);
        CartLike.like.add(flowersList[index]);
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
                  '${flowersList[index].price} \Руб',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),

                Row(
                children: <Widget>[
                  const SizedBox(width: 10),
                    IconButton(
                      icon: Icon(
                        Icons.local_grocery_store,
                        size: 20,
                        color: cartIndexes.contains(index) ? Colors.green : Colors.black,
                      ),
                       onPressed: () => addCart(index),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 20,
                        color: likedIndexes.contains(index) ? Colors.red : Colors.black,
                      ),
                      onPressed: () => addLike(index),
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
                Icons.local_grocery_store,
                color: Colors.black,
                size: 25,
                ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage(cartItems: CartLike.cart)
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
                  MaterialPageRoute(builder: (context) => LikePage(likeItems: CartLike.like)
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
                Icons.android,//Личный кабинет
                color: Colors.black,
                size: 25,
                ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}