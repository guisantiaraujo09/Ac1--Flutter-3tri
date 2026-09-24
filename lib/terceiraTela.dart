import 'package:ac01_3tri_4telas/quartaTela.dart';
import 'package:flutter/material.dart';
import 'widgets/meusBotoes.dart';
import 'widgets/meusTextfields.dart';

class terceiraTela extends StatelessWidget {
  final String nomeComandante;
  final int tripulantes;
  final double distanLuz;
  final int dias;
  final double custoCombustivel;
  final double custOxigenio;
  final double orcamenTotal;

  final caixaGoverno = TextEditingController();
  final velocidadeMotor = TextEditingController();

  double saldoFinal = 0;
  double desgaste = 0;

  terceiraTela({
    super.key,
    required this.nomeComandante,
    required this.tripulantes,
    required this.distanLuz,
    required this.dias,
    required this.custoCombustivel,
    required this.custOxigenio,
    required this.orcamenTotal,
  });

  void abrirQuarta(BuildContext context) {
    double caixa = double.tryParse(caixaGoverno.text) ?? 0;
    double vel = double.tryParse(velocidadeMotor.text) ?? 0;

    if (caixa <= 0) {
      meuSnackbar3("Digite o orçamento do governo", context);
      return;
    }

    if (vel < 1 || vel > 100) {
      meuSnackbar3("Digite a velocidade entre 1 e 100", context);
      return;
    }

    saldoFinal = caixa - orcamenTotal;
    desgaste = (vel / 10) * dias;
    bool riscoPane = vel > 80;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => quartaTela(
          nomeComandante: nomeComandante,
          tripulantes: tripulantes,
          distanLuz: distanLuz,
          dias: dias,
          custoCombustivel: custoCombustivel,
          custOxigenio: custOxigenio,
          orcamenTotal: orcamenTotal,
          caixa: caixa,
          saldoFinal: saldoFinal,
          velocidade: vel,
          desgaste: desgaste,
          riscoPane: riscoPane,
        ),
      ),
    );
  }

  void meuSnackbar3(String mensagem, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: Duration(seconds: 3),
        backgroundColor: const Color.fromARGB(255, 144, 22, 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Terceira Tela")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            meuTextField("Digite o orçamento do governo", Icons.attach_money, caixaGoverno),
            meuTextField("Digite a velocidade do motor (1 a 100)", Icons.speed, velocidadeMotor),
            SizedBox(height: 20),
            meusBotoes("Gerar Relatório", () {
              abrirQuarta(context);
            }, Colors.white)
          ],
        ),
      ),
    );
  }
}