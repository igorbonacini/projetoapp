import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
      routes: {
        '/cadastro': (context) => CadastroView(),
        '/recuperar_senha': (context) => RecuperarSenhaView(),
      },
    );
  }
}

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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TelaBemVindo()));
      } else {
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

class TelaBemVindo extends StatelessWidget {
  void _navegarParaCadastroVeiculo(BuildContext context, String veiculo) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CadastroVeiculo(veiculo)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.directions_car, size: 60.0),
              SizedBox(width: 20),
              Icon(Icons.motorcycle, size: 60.0),
              SizedBox(width: 20),
              Icon(Icons.directions_bus, size: 60.0),
              SizedBox(width: 20),
              Icon(Icons.local_shipping, size: 60.0),
            ],
          ),
          SizedBox(height: 40.0),
          Text(
            'Escolha uma das opções:',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () {
              _navegarParaCadastroVeiculo(context, 'Carro');
            },
            child: Text('Opção 1: Carro'),
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () {
              _navegarParaCadastroVeiculo(context, 'Moto');
            },
            child: Text('Opção 2: Moto'),
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () {
              _navegarParaCadastroVeiculo(context, 'Van');
            },
            child: Text('Opção 3: Van'),
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () {
              _navegarParaCadastroVeiculo(context, 'Caminhão');
            },
            child: Text('Opção 4: Caminhão'),
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaPreco()),
              );
            },
            child: Text('Opção 5: Consultar Preços'),
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaAvaliacao()),
              );
            },
            child: Text('Opção 6: Avaliar'),
          ),
        ],
      ),
    );
  }
}

class TelaPreco extends StatelessWidget {
  final List<String> veiculos = ['Carro', 'Moto', 'Van', 'Caminhão'];
  final List<String> precos = ['R\$5,00', 'R\$3,00', 'R\$7,50', 'R\$10,00'];
  final List<String> descricao = [
    'Por hora',
    'Por hora',
    'Por hora',
    'Por hora'
  ];

  final Map<String, int> vagas = {
    'Carro': 30,
    'Moto': 22,
    'Van': 11,
    'Caminhão': 7,
  };

  int totalVagas = 0;

  TelaPreco() {
    totalVagas = vagas.values.reduce((value, element) => value + element);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preços e Vagas'),
      ),
      body: Column(
        children: [
          Text(
            'PREÇOS',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: veiculos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(veiculos[index]),
                subtitle: Text('${precos[index]} - ${descricao[index]}'),
              );
            },
          ),
          SizedBox(height: 20),
          Text(
            'QUANTIDADE DE VAGAS POR VEICULO',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: vagas.length,
            itemBuilder: (context, index) {
              final veiculo = vagas.keys.elementAt(index);
              final quantidadeVagas = vagas.values.elementAt(index);
              return ListTile(
                title: Text(veiculo),
                subtitle: Text('$quantidadeVagas vagas'),
              );
            },
          ),
          SizedBox(height: 20),
          Text(
            'TOTAL DE VAGAS DISPONIVEIS:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            '$totalVagas vagas',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class TelaAvaliacao extends StatefulWidget {
  @override
  _TelaAvaliacaoState createState() => _TelaAvaliacaoState();
}

class _TelaAvaliacaoState extends State<TelaAvaliacao> {
  String mensagem = '';
  TextEditingController opiniaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conte sua experiência'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.0),
          Text(
            'Sua opinião vale muito para nós. Conte-nos sobre sua experiência:',
            style: TextStyle(fontSize: 18.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sentiment_very_satisfied,
                size: 60.0,
                color: Colors.green,
              ),
              Icon(
                Icons.sentiment_neutral,
                size: 60.0,
                color: Colors.amber,
              ),
              Icon(
                Icons.sentiment_very_dissatisfied,
                size: 60.0,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            'Diga-nos como foi sua experiência:',
            style: TextStyle(fontSize: 18.0),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: opiniaoController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Digite sua opinião aqui...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final opiniao = opiniaoController.text;
              if (opiniao.isEmpty) {
                setState(() {
                  mensagem = 'Ops, por favor preencha o campo :(';
                });
              } else {
                setState(() {
                  mensagem = 'Muito obrigado, sua avaliação foi enviada :)';
                });
              }
            },
            child: Text('Enviar'),
          ),
          SizedBox(height: 20.0),
          Text(
            mensagem,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CadastroVeiculo extends StatefulWidget {
  final String veiculo;

  CadastroVeiculo(this.veiculo);

  @override
  _CadastroVeiculoState createState() => _CadastroVeiculoState();
}

class _CadastroVeiculoState extends State<CadastroVeiculo> {
  TextEditingController marcaController = TextEditingController();
  TextEditingController placaController = TextEditingController();
  TextEditingController anoController = TextEditingController();
  TextEditingController corController = TextEditingController();

  String mensagem = '';

  void _cadastrarVeiculo() {
    final marca = marcaController.text;
    final placa = placaController.text;
    final ano = anoController.text;
    final cor = corController.text;

    if (marca.isEmpty || placa.isEmpty || ano.isEmpty || cor.isEmpty) {
      setState(() {
        mensagem = 'Preencha todos os campos.';
      });
    } else {
      setState(() {
        mensagem = 'Veículo cadastrado com sucesso!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de ${widget.veiculo}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 30.0),
          Text('Cadastro de ${widget.veiculo}'),
          SizedBox(width: 30.0),
          TextField(
            controller: marcaController,
            decoration: InputDecoration(labelText: 'Marca'),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: placaController,
            decoration: InputDecoration(labelText: 'Placa'),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: anoController,
            decoration: InputDecoration(labelText: 'Ano'),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: corController,
            decoration: InputDecoration(labelText: 'Cor'),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _cadastrarVeiculo,
            child: Text('Cadastrar'),
          ),
          SizedBox(height: 20.0),
          Text(mensagem, style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}

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

// Aluno: Igor Bonacini     RA:2840482021028