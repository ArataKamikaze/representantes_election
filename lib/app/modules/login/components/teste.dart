import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/login/login_controller.dart';
import '../../../components/input_field.dart';
import '../pages/register/auth.dart';
import '../pages/register/auth_exception.dart';
import '../pages/register/auth_or_home_page.dart';

enum AuthMode { Signup, Login }

class Teste extends StatefulWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  _TesteState createState() => _TesteState();
}
// APENAS TESTES
class _TesteState extends State<Teste> {
  final _passwordController = TextEditingController();
  final _loginController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  AuthMode _authMode = AuthMode.Login;
  // ignore: prefer_final_fields
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  bool _isLogin() => _authMode == AuthMode.Login;
  bool _isSignup() => _authMode == AuthMode.Signup;

  void _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.Signup;
      } else {
        _authMode = AuthMode.Login;
      }
    });
  }

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Ocorreu um erro'),
        content: Text(msg),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
              child: Text('Fechar'))
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() => _isLoading = true);

    _formKey.currentState?.save();

    Auth auth = Provider.of(context, listen: false);

    try {
      if (_isLogin()) {
        //login
        await auth.login(
          _authData['email']!,
          _authData['password']!,
        );
      } else {
        //register
        await auth.signup(
          _authData['email']!,
          _authData['password']!,
        );
      }
    } on AuthException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog('Ocorreu um erro inesperado!');
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 100,
              width: 100,
              child: Image.asset("assets/images/logo.png")),
          SizedBox(height: 27),
          Container(
            width: double.infinity,
            child: Text(
              "Usuário:",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          SizedBox(height: 5),
          InputField(
            context: context,
            controller: _loginController,
            onSaved: (email) => _authData['email'] = email ?? '',
            validator: (_email) {
              final email = _email ?? '';
              if (email.trim().isEmpty || !email.contains('@')) {
                return 'Informe um e-mail válido.';
              }
              return null;
            },
            prefix: Icon(
              Icons.perm_identity,
              size: 20,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          SizedBox(height: 27),
          Container(
            width: double.infinity,
            child: Text("Senha:",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                )),
          ),
          SizedBox(height: 5),
          InputField(
            context: context,
            obscureText: true,
            controller: _passwordController,
            onSaved: (password) => _authData['password'] = password ?? '',
            validator: (_password) {
              final password = _password ?? '';
              if (password.isEmpty || password.length < 5) {
                return 'Informe uma senha válida';
              }
              return null;
            },
            prefix: Icon(
              Icons.lock_outline,
              size: 20,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Esqueci minha senha"),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text("Register"))
            ],
          ),
          if (_isLoading)
            const CircularProgressIndicator()
          else
            ElevatedButton(onPressed: _submit, child: Text("Login"))
        ],
      ),
    );
  }
}
