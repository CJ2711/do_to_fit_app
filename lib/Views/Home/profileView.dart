import 'package:do_to_fit_app/Views/Login/login.dart';
import 'package:do_to_fit_app/api/google_signin_api.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileView extends StatelessWidget {
  final GoogleSignInAccount user;

  ProfileView({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Do To Fit'),
          centerTitle: true,
          actions: [
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
        body: Container(
          alignment: Alignment.center,
          color: Colors.blueGrey.shade900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pérfil',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 32),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.photoUrl!),
              ),
              SizedBox(height: 8),
              Text(
                'Nombre: ' + user.displayName!,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 8),
              Text(
                'Email' + user.email,
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ),
        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => ProfileView(user: user), //ESTA ES LA VENTANA QUE SE ABRIRÍA INICIAR SESIÓN
        // ));
      );
}
