import 'package:do_to_fit_app/components/infoBox.dart';
import 'package:do_to_fit_app/model/Classes/usuario.dart';
import 'package:flutter/material.dart';

class Routines extends StatefulWidget {
  const Routines({Key? key, required Usuario user}) : super(key: key);

  @override
  _RutinesWidgetState createState() => _RutinesWidgetState();
}

class _RutinesWidgetState extends State<Routines> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade500,
        automaticallyImplyLeading: true,
        title: Text(
          'Rutinas',
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
                    /**Base para cada contenedor que está repetido para 6 días
                     * Lunes a Sábado */

                    //TODO: Acomodar en BackEnd para que esto esté acorde al plan de entrenamiento de cada usuario
                    InfoBox(
                      imageBC: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.asset(
                          'assets/images/r1.png',
                        ).image,
                      ),
                      textLarge: 'Día Lunes',
                      textMedium: '30 minutos | Intensidad Alta',
                      textMedium2: 'En Casa o Exteriores',
                    ),
                    InfoBox(
                      imageBC: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.asset(
                          'assets/images/r2.png',
                        ).image,
                      ),
                      textLarge: 'Día Martes',
                      textMedium: '30 minutos | Intensidad Media',
                      textMedium2: 'En Casa o Exteriores',
                    ),
                    InfoBox(
                      imageBC: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.asset(
                          'assets/images/r3.png',
                        ).image,
                      ),
                      textLarge: 'Día Miércoles',
                      textMedium: '45 minutos | Intensidad Alta',
                      textMedium2: 'En Casa o Exteriores',
                    ),
                    InfoBox(
                      imageBC: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.asset(
                          'assets/images/r4.png',
                        ).image,
                      ),
                      textLarge: 'Día Jueves',
                      textMedium: '40 minutos | Intensidad Media',
                      textMedium2: 'En Casa o Exteriores',
                    ),
                    InfoBox(
                      imageBC: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.asset(
                          'assets/images/r5.png',
                        ).image,
                      ),
                      textLarge: 'Día Viernes',
                      textMedium: '35 minutos | Intensidad Alta',
                      textMedium2: 'En Casa o Exteriores',
                    ),
                    InfoBox(
                      imageBC: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.asset(
                          'assets/images/r6.png',
                        ).image,
                      ),
                      textLarge: 'Día Sábado',
                      textMedium: '30 minutos | Intensidad Baja',
                      textMedium2: 'En Casa o Exteriores',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
