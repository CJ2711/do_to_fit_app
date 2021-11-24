import 'dart:convert';
import 'package:http/http.dart' as http;

enum Target {
  aumentarMasa,
  mantenerse,
  bajarPeso,
}

class Usuario {
  const Usuario({
    required this.nombreApellido,
    required this.correo,
    required this.contrasenia,
    required this.peso,
    required this.altura,
    required this.target,
  });

  final String nombreApellido;
  final String correo;
  final String contrasenia;
  final double peso;
  final double altura;
  final Target target;

  Future<void> agregarUsuario(usuario) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.https('awssite.com', 'user/create'),
          body: {'name': usuario.toString(nombreApellido), 'color': 'blue'});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var uri = Uri.parse(decodedResponse['uri'] as String);
      print(await client.get(uri));
    } finally {
      client.close();
    }
  }

  Future<void> test(usuario) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.https('awssite.com', 'user/create'),
          body: {'name': usuario.toString(nombreApellido), 'color': 'blue'});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var uri = Uri.parse(decodedResponse['uri'] as String);
      print(await client.get(uri));
    } finally {
      client.close();
    }
  }
}
