import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PlanCarousel extends StatefulWidget {
  // const PlanCarousel({Key? key}) : super(key: key);
  @override
  _PlanCarouselState createState() => _PlanCarouselState();
}

class _PlanCarouselState extends State<PlanCarousel> {
  int _current = 0;
  final List<String> imgList = [
    'https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg',
    'https://images.pexels.com/photos/8805106/pexels-photo-8805106.jpeg'
  ];
  final List<String> plans = [
    'Planes de Entrenamiento',
    'Planes de Alimentación'
  ];

  List<Widget> generateImagesTiles() {
    // element es la dirección de las imgs
    return imgList
        .map((element) => ClipRRect(
              child: Image.network(
                element,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Stack(
        children: [
          // Area del Carousel
          CarouselSlider(
            items: generateImagesTiles(),
            options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                //Con aspectRatio se modifica el tamaño de separacion entre imgs
                aspectRatio: 1.8,
                onPageChanged: (index, other) {
                  setState(() {
                    // Acá se cambia el texto que se muestra respectivamente.
                    _current = index;
                  });
                }),
          ),
          AspectRatio(
            aspectRatio: 1.8,
            child: Center(
              child: Text(
                plans[_current],
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontFamily: 'Poppins-Bold.ttf',
                  fontSize: MediaQuery.of(context).size.width / 18,
                ),
              ),
            ),
          )
          // Area de Noticias
        ],
      ),
    );
  }
}
