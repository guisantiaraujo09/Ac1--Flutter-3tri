import 'package:flutter/material.dart';
// Importa o arquivo onde criamos a TelaInicial
import 'telaInicial.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Define qual será a primeira tela aberta
      // Neste caso: TelaInicial()
      home: TelaInicial(),
    );
  }
}