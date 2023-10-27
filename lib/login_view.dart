import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  void _entrar(BuildContext context) {
    final email = emailController.text;
    final senha = senhaController.text;

    if (email.isEmpty || senha.isEmpty) {
      _showErrorMessage(context, 'Preencha todos os campos.');
    } else if (!_isEmailValid(email)) {
      _showErrorMessage(context, 'E-mail inválido.');
    } else {
      if (email == 'igorbonacini@gmail.com' && senha == '140523') {

        _showErrorMessage(context, 'Credenciais inválidas.');
      }
    }
  }

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

  void _showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erro'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarSobre(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sobre'),
          content: Text(
            'Olá, obrigado por utilizar meu Aplicativo. Sou Igor Bonacini, aluno da Fatec Ribeirão Preto, e este é meu projeto de um App para cadastro de veículos de um estacionamento.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.login, size: 100.0),
            SizedBox(height: 20.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _entrar(context);
              },
              child: Text('Entrar'),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastro');
                  },
                  child: Text('Cadastrar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/recuperar_senha');
                  },
                  child: Text('Esqueceu a senha'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                _mostrarSobre(context);
              },
              child: Text('Sobre'),
            ),
          ],
        ),
      ),
    );
  }
}

