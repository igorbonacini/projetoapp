import 'package:flutter/material.dart';

class RecuperarSenhaView extends StatefulWidget {
  @override
  _RecuperarSenhaViewState createState() => _RecuperarSenhaViewState();
}

class _RecuperarSenhaViewState extends State<RecuperarSenhaView> {
  final emailController = TextEditingController();
  String mensagem = '';

  void _recuperarSenha(BuildContext context) {
    final email = emailController.text;

    if (email.isEmpty) {
      setState(() {
        mensagem = 'Por favor, digite um e-mail válido.';
      });
    } else if (!_isEmailValid(email)) {
      setState(() {
        mensagem = 'Por favor, digite um e-mail válido.';
      });
    } else {
      setState(() {
        mensagem = 'Foi enviado um e-mail ao endereço: $email';
      });
    }
  }

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Senha'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Digite seu e-mail cadastrado para recuperar a senha:'),
            SizedBox(height: 20.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _recuperarSenha(context);
              },
              child: Text('Recuperar Senha'),
            ),
            SizedBox(height: 20.0),
            Text(
              mensagem,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: mensagem.contains('enviado') ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
