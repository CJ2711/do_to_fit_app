import 'package:do_to_fit_app/Views/Home/diets.dart';
import 'package:do_to_fit_app/Views/Home/profileView.dart';
import 'package:do_to_fit_app/Views/Home/routines.dart';
import 'package:do_to_fit_app/api/google_signin_api.dart';
import 'package:do_to_fit_app/model/Classes/usuario.dart';
import 'package:flutter/material.dart';
import 'package:do_to_fit_app/components/carousel.dart' as carousel;
import 'package:do_to_fit_app/model/News_Section/newsOn.dart' as newsSection;

import '../Login/login.dart';

class Home extends StatelessWidget {
  // final GoogleSignInAccount? user;
  final Usuario usuario;
  const Home({Key? key, required this.usuario}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('DoToFit'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.person,
                semanticLabel: 'Perfil',
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileView(
                        user: usuario,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Expanded(
                      child:
                          //    Container(
                          //     height: 70,
                          //     decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //       image: DecorationImage(
                          //         image: NetworkImage(user!.photoUrl!),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Container(
                        child: (Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: Text(usuario.getName),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Perfil'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProfileView(
                          user: usuario,
                        );
                      },
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.whatshot_outlined),
                title: Text('Rutinas'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Routines(
                          user: usuario,
                        );
                      },
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.food_bank_outlined),
                title: Text('Dietas'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Diets(
                          user: usuario,
                        );
                      },
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Cerrar Sesión'),
                onTap: () async {
                  await GoogleSignInApi.logout();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                },
              )
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              // Expandido forzará a los subcomponentes a llenar el espacio
              // disponible, el valor predeterminado es una división igual,
              // luego establecer el tamaño en el interior no tiene ningún efecto,
              // Disponible con Flexible, no se verá obligado a llenar,
              // el tamaño del subcomponente en sí es tanto como sea
              // posible (vea el efecto usted mismo)
              new Expanded(child: carousel.PlanCarousel()),
              new Expanded(
                flex: 2,
                child: newsSection.NewsSection(),
              ), // flex por defecto es 1, división igual, establece 2 luego ocupa 2/3 del espacio
            ],
          ),
        ),
      );
}
