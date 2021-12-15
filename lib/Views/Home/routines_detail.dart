import 'package:do_to_fit_app/Views/Home/components_routine/infoBoxRoutines.dart';
import 'package:flutter/material.dart';

class RoutinesDetail extends StatefulWidget {
  const RoutinesDetail({Key? key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<RoutinesDetail> {
  late TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade500,
        automaticallyImplyLeading: true,
        title: Text(
          "Rutinas",
          style: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.asset(
                  "assets/images/routine-top.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InfoBoxRoutines(
                        nameRoutine: 'Saltos de Tijera',
                        timeRoutine: '0:30',
                        routineImage: Image.asset(
                          'assets/images/jumping-jack.gif',
                          width: 74,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InfoBoxRoutines(
                        nameRoutine:
                            'Flexiones con Inclinación (Apoyo de Brazos)',
                        timeRoutine: 'x10',
                        routineImage: Image.asset(
                          'assets/images/inclined-push-ups.gif',
                          width: 74,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InfoBoxRoutines(
                        nameRoutine: 'Flexiones con Apoyo de Rodillas',
                        timeRoutine: 'x8',
                        routineImage: Image.asset(
                          'assets/images/Knee-push-up.gif',
                          width: 74,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InfoBoxRoutines(
                        nameRoutine: 'Flexiones',
                        timeRoutine: 'x8',
                        routineImage: Image.asset(
                          'assets/images/push-ups.gif',
                          width: 74,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InfoBoxRoutines(
                        nameRoutine: 'Flexiones con Brazos Abiertos',
                        timeRoutine: 'x8',
                        routineImage: Image.asset(
                          'assets/images/openarm.gif',
                          width: 74,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InfoBoxRoutines(
                        nameRoutine:
                            'Flexiones con Inclinación (Apoyo de Brazos)',
                        timeRoutine: 'x10',
                        routineImage: Image.asset(
                          'assets/images/inclined-push-ups.gif',
                          width: 74,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InfoBoxRoutines(
                        nameRoutine: 'Flexiones con Apoyo de Rodillas',
                        timeRoutine: 'x8',
                        routineImage: Image.asset(
                          'assets/images/Knee-push-up.gif',
                          width: 74,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InfoBoxRoutines(
                        nameRoutine: 'Flexiones',
                        timeRoutine: 'x8',
                        routineImage: Image.asset(
                          'assets/images/push-ups.gif',
                          width: 74,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InfoBoxRoutines(
                        nameRoutine: 'Flexiones con Brazos Abiertos',
                        timeRoutine: 'x8',
                        routineImage: Image.asset(
                          'assets/images/openarm.gif',
                          width: 74,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InfoBoxRoutines(
                        nameRoutine: 'Estiramiento de Cobra',
                        timeRoutine: '0:30',
                        routineImage: Image.asset(
                          'assets/images/cobra-stretch.png',
                          width: 74,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InfoBoxRoutines(
                        nameRoutine: 'Estiramiento de Pecho',
                        timeRoutine: '0:30',
                        routineImage: Image.asset(
                          'assets/images/chest-stretch.png',
                          width: 74,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.white,
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
        ],
      ),
    );
  }
}
