import 'package:flutter/material.dart';

class CadastroView extends StatefulWidget {
  @override
  _CadastroViewState createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  String mensagem = '';

  void _cadastrar(BuildContext context) {
    final nome = nomeController.text;
    final email = emailController.text;
    final senha = senhaController.text;

    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      setState(() {
        mensagem = 'Por favor, preencha os dados corretamente.';
      });
    } else {
      setState(() {
        mensagem = 'Usuário cadastrado com sucesso.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Preencha os campos abaixo para se cadastrar:'),
            SizedBox(height: 20.0),
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
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
                _cadastrar(context);
              },
              child: Text('Cadastrar'),
            ),
            SizedBox(height: 20.0),
            Text(
              mensagem,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: mensagem.contains('sucesso') ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}