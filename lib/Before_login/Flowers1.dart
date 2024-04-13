import 'package:flutter/material.dart';
import 'package:flutter_application_2/login/Authorization.dart';
import 'package:flutter_application_2/Before_login/Home1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_application_2/modul/DataBase.dart';


  //Подробная информация о цветах
  class DescriptionFlovers1 extends StatefulWidget {
    final int id;


    const DescriptionFlovers1({
      Key? key,
      required this.id,
    }) : super(key: key);


  @override
    _DescriptionFloversState1 createState() => _DescriptionFloversState1();
  }

  class _DescriptionFloversState1 extends State<DescriptionFlovers1> {
    int activeIndex = 0;
   
  @override
    Widget build(BuildContext context) {
      //YoutubePlayerController controller = YoutubePlayerController(
          //initialVideoId: widget.video,
          //flags: const YoutubePlayerFlags(
            //autoPlay: false,
          //));
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240
        ),
        appBar: AppBar(
          title: Text(flowersList[widget.id].name), 
          centerTitle: true,
        ),
        body: SingleChildScrollView( 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              itemCount: flowersList[widget.id].fimage.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    child: Image.network(flowersList[widget.id].fimage[index]),
                  );
                },
              ),
              const SizedBox(height: 30),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: flowersList[widget.id].fimage.length,
              ),
                const SizedBox(height: 30),
                Center(
                  child: Container(
                    decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(25
                    ),
                    color: const Color.fromARGB(255, 230, 230, 230,
                  ),
                    ),
                    padding: const EdgeInsets.only(left: 20, right: 20
                    ),
                    height: 150, 
                    width: 400, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          flowersList[widget.id].name, 
                          style: const TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                          ),
                        ),
                        const SizedBox(height: 10), 
                        Text(
                          '${flowersList[widget.id].price} Руб',
                          style: const TextStyle(
                          fontSize: 19, 
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                          ),
                        ),
                        const SizedBox(height: 10), 
                     IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            size: 25,
                            color: Colors.black
                          ),
                          onPressed: () {},
                          )
                        ]
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70, //высота
                    width: 170, //ширина
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  child: const Text(
                    'В корзину',
                    style: TextStyle(
                    fontSize: 18, 
                    color: Colors.black
                   ),
                   ),
                onPressed: () => _dialogBuilder1(context),
            ),
            ),   
            const SizedBox(width: 20),
            SizedBox(
              height: 70, //высота
              width: 170, //ширина
              child: ElevatedButton(
                style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Купить сейчас',
                    style: TextStyle(
                    fontSize: 18, 
                    color: Colors.black
                   ),
                   ),
            onPressed: () => _dialogBuilder1(context),
            ),
            ), 
                ],
              ),
                  ),
              const SizedBox(height: 22),
              Center(
                child: Container(
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(25
                    ),
                    color: const Color.fromARGB(255, 230, 230, 230),
                  ),
                padding: const EdgeInsets.only(
                  left: 20,  
                  right: 20
                ),
                height: 200, //высота
                width: 400, //ширина
                child: SingleChildScrollView(
                child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const SizedBox(height: 17), 
                        const Text(
                          "Описание:", 
                          style:  TextStyle(fontSize: 23, 
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color:Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20
                        ),
                        Text(
                          flowersList[widget.id].description, //Описание Товара
                          style: const TextStyle(fontSize: 20, 
                          color: Colors.black
                          ),
                        ),
                        ],
                    ),
                    ),
                  ),
                  ),
              const SizedBox(height: 25
              ), 
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25
                    ),
                    color: const Color.fromARGB(255, 230, 230, 230
                    ),
                  ),
                padding: const EdgeInsets.only(
                  left: 20,  
                  right: 20
                ),
                height: 900, //высота
                width: 400, //ширина
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Характеристики:", 
                          style: TextStyle(fontSize: 23, 
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color:Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20
                        ),
                        Text(
                         flowersList[widget.id].specifications, //Характеристики товара
                          style: const TextStyle(fontSize: 20, 
                          color: Colors.black
                          ),
                        ),
                        ],
                    ),
                    ),
                  ),
                const SizedBox(height: 25
                ),
                  Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25
                    ),
                    color: const Color.fromARGB(255, 230, 230, 230
                    ),
                  ),
                padding: const EdgeInsets.only(
                  left: 20,  
                  right: 20
                ),
                height: 200, //высота
                width: 400, //ширина
                  child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Скоро тут будет красиво... ',
                        style: TextStyle(fontSize: 20, ),
                        ),
                        Text('(Тут должно было быть видео, но....)',
                        style: TextStyle(fontSize: 20, )),
                        //YoutubePlayer(
                            //controller: controller,
                          //),
                        ],
                    ),
                    ),
                  ),
                  const SizedBox(height: 25
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
                onPressed: () => _dialogBuilder(context),
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite_border,//Избранное
                  color: Colors.red,
                  size: 25,
                  ),
                onPressed: () => _dialogBuilder(context),
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
                      MaterialPageRoute(builder: (context) => const Home1()
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


Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ошибка'),
          content: const Text(
            'Чтобы просматривать этот раздел, вам необходимо войти.'
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Закрыть'),
              onPressed: () {
                  Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _dialogBuilder1(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ошибка'),
          content: const Text(
            'Чтобы преобрести товар, вам необходимо войти.'
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Закрыть'),
              onPressed: () {
                  Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}