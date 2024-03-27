import 'package:flutter/material.dart';
import 'modul/DataBase.dart';
import 'Flowers.dart';
import 'Like.dart';

class CartPage extends StatelessWidget {
  final List<Flowers> cartItems;

  CartPage({required this.cartItems});
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
            cartItems[index].image, 
            width: 50, 
            height: 50
            ),
            title: Text(
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              cartItems[index].name,
              ),
            subtitle: Text(
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              '${cartItems[index].price} \Руб',
              ),
              trailing: IconButton(
              icon: const Icon(
                Icons.close, 
                color: Colors.black
                ),
              onPressed: () {},
            ),
              onTap: () {
             Navigator.push( 
          context,
          MaterialPageRoute(builder: (context) =>  DescriptionFlovers(
                    name: flowersList[index].name,
                    price: flowersList[index].price,
                    description: flowersList[index].description,
                    specifications: flowersList[index].specifications,
                    //video: flowersList[index].video,
                    fimage: fimageList[index].fimage,
                    )
            ),
          );
        },
          );
        },
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
                  MaterialPageRoute(builder: (context) => LikePage(likeItems: CartLike.like)
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