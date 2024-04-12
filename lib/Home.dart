import 'package:flutter/material.dart';
import 'PersonalAccount.dart';
import 'Cart.dart';
import 'Like.dart';
import 'modul/DataBase.dart';
import 'Flowers.dart';

// Главный экран магазина
class Home extends StatefulWidget {
 
  const Home({super.key,});

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Floral Fantasy'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search
            )
          ),
          const SizedBox(width: 30)
        ],
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
                Row(
                children: <Widget>[
                  const SizedBox(width: 10),
                    IconButton(
                    icon: Icon(
                      Icons.local_grocery_store,
                      size: 20,
                      color: cart.contains(flowersList[index]) ? Colors.green : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        if (!cart.contains(flowersList[index])) {
                          cart.add(flowersList[index]);
                        } else {
                          cart.remove(flowersList[index]);
                        }
                      });
                    },   
                  ),
                  IconButton(
                  icon: Icon(
                    Icons.favorite,
                    size: 20,
                    color: like.contains(flowersList[index]) ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      if (!like.contains(flowersList[index])) {
                        like.add(flowersList[index]);
                      } else {
                        like.remove(flowersList[index]);
                      }
                    });
                  },   
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


//Поиск в приложении
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 230, 230),
            borderRadius: BorderRadius.circular(5)
            ),
        child: Center(
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                  },
                ),
                hintText: 'Поиск...',
                border: InputBorder.none),
          ),
        ),  
      )),
    );  
  }
}