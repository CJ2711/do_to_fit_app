import 'package:do_to_fit_app/components/infoBox.dart';
import 'package:do_to_fit_app/model/Classes/usuario.dart';
import 'package:flutter/material.dart';

class Diets extends StatefulWidget {
  const Diets({Key? key, required Usuario user}) : super(key: key);

  @override
  _DietsWidgetState createState() => _DietsWidgetState();
}

class _DietsWidgetState extends State<Diets> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade500,
        automaticallyImplyLeading: true,
        title: Text(
          'Dietas',
          style: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InfoBox(
                      imageBC: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.asset(
                          'assets/images/breakfast.png',
                        ).image,
                      ),
                      textLarge: 'Desayuno',
                      textMedium: '6:00am - 8:00am',
                      textMedium2: '',
                      pageTransition: InkWell(
                        // onTap: () async {
                        //   await Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => DietDetail(),
                        //     ),
                        //   );
                        // },
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    InfoBox(
                      imageBC: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.asset(
                          'assets/images/lunch.png',
                        ).image,
                      ),
                      textLarge: 'Almuerzo',
                      textMedium: '12:00pm - 1:00pm',
                      textMedium2: '',
                      pageTransition: InkWell(
                        // onTap: () async {
                        //   await Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => DietDetail(),
                        //     ),
                        //   );
                        // },
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    InfoBox(
                      imageBC: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.asset(
                          'assets/images/dinner.png',
                        ).image,
                      ),
                      textLarge: 'Cena',
                      textMedium: '5:30pm - 7:00pm',
                      textMedium2: '',
                      pageTransition: InkWell(
                        // onTap: () async {
                        //   await Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => DietDetail(),
                        //     ),
                        //   );
                        // },
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 125,
            decoration: BoxDecoration(
              color: Color(0xFFF1F4F8),
            ),
            child: Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login-bottom-ph.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
