import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget {
  // Variável que recebe o nome enviado
  final String nomeComandante;
  // Variável que recebe o email enviado
  final int tripulantes;
  final double distanLuz;

  const SegundaTela({
    super.key,
    required this.nomeComandante,
    required this.tripulantes,
    required this.distanLuz
  });

  void voltarTela(BuildContext context) {
    // fecha tela atual
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Segunda Tela")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                voltarTela(context);
              },
              child: const Text("Corrigir"),
            ),
          ],
        ),
      ),
    );
  }
}