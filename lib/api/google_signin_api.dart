import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  // static final _clientIDWeb = '' //ClientID que genera el OAuth al crear la API para web

  static final _googleSignIn = GoogleSignIn();
  // static final _googleSignIn = GoogleSignIn(clientId: _clientIDWeb);

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future logout() =>_googleSignIn.disconnect();
}
