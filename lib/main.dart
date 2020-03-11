import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando transferencia'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerCampoNumeroConta,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Numero da Conta',
                  hintText: '0000',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerCampoValor,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '00.0',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () {
                final int numeroConta =
                    int.tryParse(_controllerCampoNumeroConta.text);
                final double valor =
                    double.tryParse(_controllerCampoValor.text);
                if (numeroConta != null && valor != null) {
                  final transferenciaCriada = Trasferencia(valor, numeroConta);
                  debugPrint('$transferenciaCriada');
                }
              },
            ),
          ],
        ));
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferencias'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Trasferencia(100, 300)),
          ItemTransferencia(Trasferencia(200, 700)),
          ItemTransferencia(Trasferencia(400, 1342)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Trasferencia _trasferencia;

  ItemTransferencia(this._trasferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_trasferencia.valor.toString()),
        subtitle: Text(_trasferencia.numeroConta.toString()),
      ),
    );
  }
}

class Trasferencia {
  final double valor;
  final int numeroConta;

  Trasferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Trasferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
