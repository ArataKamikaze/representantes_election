import 'dart:convert';
import 'auth_exception.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

/*Temos a classe Auth com a herança do ChangeNotifier, changenotifier é a 
própriedade que permite mandar notificações para mudança de estado para qualquer widget ou função que queira ouvir*/

class Auth with ChangeNotifier {
//Temos os atributos de autenticação recebidos pelo firebase 
  String? _token;
  String? _email;
  String? _uid;
  DateTime? _expiryDate;
//Getters de autenticação, token, e-mail e id
  bool get isAuth {
    final isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  String? get email {
    return isAuth ? _email : null;
  }

  String? get uid {
    return isAuth ? _uid : null;
  }

  //Função de autenticação, fragmentamos a url de login e de registro para maior organização e fizemos um tratamento de erro recebidos pelo firebase

  Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyB6fzNGkR9Llmgy8oHOD6QkWMwClpvU0t4';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['email'];
      _uid = body['localId'];

      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(body['expiresIn']),
        ),
      );
      notifyListeners();
    }
  }

// Metodo de registro

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

// Metodo de login
  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
