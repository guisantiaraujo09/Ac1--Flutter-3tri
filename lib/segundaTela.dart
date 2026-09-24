import 'package:ac01_3tri_4telas/terceiraTela.dart';
import 'package:flutter/material.dart';
import 'widgets/meusBotoes.dart';
import 'widgets/meusTextfields.dart';

class SegundaTela extends StatelessWidget {
  final String nomeComandante;
  final int tripulantes;
  final double distanLuz;

  final diasViagem = TextEditingController();
  final custoKilo = TextEditingController();

  double combustiTota = 0;
  double custoCombustivel = 0;
  double racaOxigenio = 0;
  double custOxigenio = 0;
  double orcamenTotal = 0;

  SegundaTela({
    super.key,
    required this.nomeComandante,
    required this.tripulantes,
    required this.distanLuz,
  });

  void abrirTerceira(BuildContext context) {
    int dias = int.tryParse(diasViagem.text) ?? 0;
    double custoK = double.tryParse(custoKilo.text) ?? 0;

    if (dias <= 0) {
      meuSnackbar2("Digite o numero de dias", context);
      return;
    }
    if (custoK <= 0) {
      meuSnackbar2("Digite o custo por kilo de combustivel", context);
      return;
    }

    combustiTota = (distanLuz * tripulantes) * 1000;
    custoCombustivel = combustiTota * custoK;

    racaOxigenio = tripulantes * dias * 2.5;
    custOxigenio = racaOxigenio * 50;

    orcamenTotal = custoCombustivel + custOxigenio;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => terceiraTela(
          nomeComandante: nomeComandante,
          tripulantes: tripulantes,
          distanLuz: distanLuz,
          dias: dias,
          custoCombustivel: custoCombustivel,
          custOxigenio: custOxigenio,
          orcamenTotal: orcamenTotal,
        ),
      ),
    );
  }

  void meuSnackbar2(String mensagem, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: Duration(seconds: 3),
        backgroundColor: const Color.fromARGB(255, 144, 22, 3),
      ),
    );
  }

  void voltarTela(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Segunda Tela")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            meuTextField("Digite os dias da viagem", Icons.calendar_month, diasViagem),
            meuTextField("Custo por kg de combustível (\$)", Icons.monetization_on, custoKilo),
            SizedBox(height: 20),
            meusBotoes("Avançar para Risco", () {
              abrirTerceira(context);
            }, Colors.white),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                voltarTela(context);
              },
              child: Text("Corrigir"),
            ),
          ],
        ),
      ),
    );
  }
}