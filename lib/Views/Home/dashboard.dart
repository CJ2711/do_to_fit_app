import 'package:do_to_fit_app/Views/Home/profileView.dart';
import 'package:do_to_fit_app/api/google_signin_api.dart';
import 'package:flutter/material.dart';
import 'package:do_to_fit_app/components/carousel.dart' as carousel;
import 'package:google_sign_in/google_sign_in.dart';

import '../Login/login.dart';

class Home extends StatelessWidget {
  final GoogleSignInAccount user;
  const Home({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                        user: user,
                      );
                    },
                  ),
                );

                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //   builder: (context) => ProfileView(
                //       user: user), //ESTA ES LA VENTANA QUE SE ABRIRÍA INICIAR SESIÓN
                // ));
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
            TextButton(
              child: Text('Salir'),
              style: TextButton.styleFrom(primary: Colors.white),
              onPressed: () async {
                await GoogleSignInApi.logout();

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
              },
            )
          ],
        ),
        body: carousel.PlanCarousel(),
      );
}


// class HomePage extends StatefulWidget {
//   final GoogleSignInAccount user;
//   const HomePage({Key? key, required this.user}) : super(key: key);

//   @override
//   _HomePageState createState() => new _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   GoogleSignInAccount user = ;

//   @override
  // Widget build(BuildContext context) {
  //   // GoogleSignInAccount user = ;
  //   return Scaffold(
  //     appBar: AppBar(
  //       // leading: Image(image: ),
  //       title: const Text('DoToFit'),
  //       actions: <Widget>[
  //         IconButton(
  //           icon: const Icon(
  //             Icons.person,
  //             semanticLabel: 'Perfil',
  //           ),
  //           onPressed: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) {
  //                   return ProfileView(
  //                     user: user,
  //                   );
  //                 },
  //               ),
  //             );

  //             // Navigator.of(context).pushReplacement(MaterialPageRoute(
  //             //   builder: (context) => ProfileView(
  //             //       user: user), //ESTA ES LA VENTANA QUE SE ABRIRÍA INICIAR SESIÓN
  //             // ));
  //           },
  //         ),
  //         IconButton(
  //           icon: const Icon(
  //             Icons.menu,
  //             semanticLabel: 'menu',
  //           ),
  //           onPressed: () {
  //             print('Boton menu');
  //           },
  //         ),
  //         TextButton(
  //           child: Text('Salir'),
  //           style: TextButton.styleFrom(primary: Colors.white),
  //           onPressed: () async {
  //             await GoogleSignInApi.logout();

  //             Navigator.of(context).pushReplacement(MaterialPageRoute(
  //               builder: (context) => LoginScreen(),
  //             ));
  //           },
  //         )
  //       ],
  //     ),
  //     body: carousel.PlanCarousel(),
  //   );
  // }
// }
