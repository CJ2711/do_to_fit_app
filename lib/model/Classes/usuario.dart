import 'dart:convert';
import 'dart:ffi';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:http/http.dart' as http;

enum Goal {
  NONE,
  AUMENTAR_MASA,
  MANTENERSE,
  BAJAR_PESO,
}

enum PlanType {
  GRATUITO,
  PAGO,
}

class Usuario {
  Usuario({
    this.name,
    this.email,
    this.password,
    this.weight,
    this.height,
    this.planType = PlanType.GRATUITO,
    this.goal,
  });

  String? name;
  String? email;
  String? password;
  double? weight;
  double? height;
  PlanType? planType;
  Goal? goal;

  Future<String> userLogin(String correo, String contrasenia) async {
    var client = http.Client();
    String salida;
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://3.137.209.216/DTF-Back/public/api/login'));
      request.fields.addAll(
        {'email': correo, 'password': contrasenia},
      );

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        salida = await response.stream.bytesToString();
        print(salida);
        return salida;
      } else {
        salida = response.reasonPhrase!;
        print(response.reasonPhrase);
      }
    } finally {
      client.close();
    }
    return 'error';
  }

  void agregarUsuarioV2(Usuario usuario) async {
    var client = http.Client();
    try {
      var request = http.MultipartRequest('POST',
          Uri.parse('http://3.137.209.216/DTF-Back/public/api/register'));
      request.fields.addAll({
        'name': usuario.getName,
        'email': usuario.getEmail,
        'password': usuario.getPassword,
        'weight': usuario.getWeight.toString(),
        'height': usuario.getHeight.toString(),
        'planType': EnumToString.convertToString(PlanType.GRATUITO),
        'goal': EnumToString.convertToString(usuario.getGoal),
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
        client.close();
        return;
      }
    } finally {
      client.close();
    }
  }

  //Metodo get y set
  String get getName => name.toString();
  void setName(String value) => name = value;

  String get getEmail => email.toString();
  void setEmail(String value) => this.email = value;

  String get getPassword => password.toString();
  void setPssword(String value) => this.password = value;

  double? get getWeight => weight;
  void setWeight(String value) => weight = double.parse(value);

  double? get getHeight => height;
  void setHeight(String value) => this.height = double.parse(value);

  PlanType get getPlanType => this.planType!;
  void setPlanType(PlanType value) => this.planType = value;

  Goal get getGoal => this.goal!;
  void setGoal(Goal goal) => this.goal = goal;

  @override
  String toString() {
    return getName +
        '\n ' +
        getEmail +
        '\n  ' +
        getPassword +
        '\n  ' +
        getWeight.toString() +
        '\n  ' +
        getHeight.toString() +
        '\n  ' +
        getGoal.toString() +
        '\n';
  }
}
