import 'dart:convert';
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
    this.pssword,
    this.weight,
    this.height,
    this.planType = PlanType.GRATUITO,
    this.goal,
  });

  String? name;
  String? email;
  String? pssword;
  double? weight;
  double? height;
  PlanType? planType;
  Goal? goal;

  Future<void> agregarUsuario(usuario) async {
    var client = http.Client();
    try {
      var response = await client
          .post(Uri.https('http://3.137.209.216/api/', 'user/register'), body: {
        'name': this.name,
        'email': this.email,
        'pssword': this.pssword,
        'weight': this.weight,
        'height': this.height,
        'planType':this.planType,
        'goal': this.goal
      });

      if (response.statusCode == 201) {
        var decodedResponse =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map;
        var uri = Uri.parse(decodedResponse['uri'] as String);
        print(await client.get(uri));
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } finally {
      client.close();
    }
  }

  Future<void> test(usuario) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.https('awssite.com', 'user/create'),
          body: {'name': usuario.toString(name), 'color': 'blue'});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var uri = Uri.parse(decodedResponse['uri'] as String);
      print(await client.get(uri));
    } finally {
      client.close();
    }
  }

  //Metodo get y set
  String get getName => name.toString();
  void setName(String value) => name = value;

  String get getEmail => email.toString();
  void setEmail(String value) => this.email = value;

  String get getPssword => pssword.toString();
  void setPssword(String value) => this.pssword = value;

  double? get getWeight => weight;
  void setWeight(String value) => weight = double.parse(value);

  double? get getHeight => height;
  void setHeight(String value) => this.height = double.parse(value);

  String get getPlanType => this.planType.toString();
  void setPlanType(PlanType value) => this.planType = value;

  String get getGoal => this.goal.toString();
  void setGoal(Goal goal) => this.goal = goal;

  @override
  String toString() {
    return getName +
        '\n ' +
        getEmail +
        '\n  ' +
        getPssword +
        '\n  ' +
        getWeight.toString() +
        '\n  ' +
        getHeight.toString() +
        '\n  ' +
        getGoal +
        '\n';
  }
}
