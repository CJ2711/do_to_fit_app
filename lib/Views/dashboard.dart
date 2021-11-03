import 'package:flutter/material.dart';
import 'package:do_to_fit_app/Model/carousel.dart' as carousel;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        title: 'HomePageSS',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, title: 'HomePageSS'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: Image(image: ),
          title: const Text('DoToFit'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.person,
                semanticLabel: 'Perfil',
              ),
              onPressed: () {
                print('Boton Perfil');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.menu,
                semanticLabel: 'menu',
              ),
              onPressed: () {
                print('Boton menu');
              },
            ),
          ],
        ),
        body: carousel.PlanCarousel(),
        );
  }
}