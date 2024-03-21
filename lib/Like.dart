import 'package:flutter/material.dart';
import 'modul/DataBase.dart';
import 'Home.dart';

class LikePage extends StatelessWidget {
  final List<Flowers> likeItems;

LikePage({required this.likeItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
      ),
      body: ListView.builder(
        itemCount: likeItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              likeItems[index].image, 
              width: 50, 
              height: 50
              ),
            title: Text(
              likeItems[index].name
              ),
            subtitle: Text(
              likeItems[index].price
              ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.local_grocery_store
                ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.red,
                ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.home),
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