import 'package:flutter/material.dart';

import 'Screens/Transferencia/Lista.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.greenAccent[400],
        accentColor: Colors.greenAccent[400],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.greenAccent,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ListaTransferencias(),
    );
  }
}
