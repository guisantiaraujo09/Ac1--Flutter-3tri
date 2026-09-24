import 'package:flutter/material.dart';
import 'widgets/meusBotoes.dart';
import 'widgets/meusText.dart';
import 'telaInicial.dart';

class quartaTela extends StatelessWidget {
  final String nomeComandante;
  final int tripulantes;
  final double distanLuz;
  final int dias;
  final double custoCombustivel;
  final double custOxigenio;
  final double orcamenTotal;
  final double caixa;
  final double saldoFinal;
  final double velocidade;
  final double desgaste;
  final bool riscoPane;

  quartaTela({
    super.key,
    required this.nomeComandante,
    required this.tripulantes,
    required this.distanLuz,
    required this.dias,
    required this.custoCombustivel,
    required this.custOxigenio,
    required this.orcamenTotal,
    required this.caixa,
    required this.saldoFinal,
    required this.velocidade,
    required this.desgaste,
    required this.riscoPane,
  });

  void reiniciarMissao(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => TelaInicial()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool semSaldo = saldoFinal < 0;
    String status = "Missão Concluída com Sucesso";

    if (semSaldo || riscoPane) {
      status = "Missão Resgatada com Avarias";
    }

    return Scaffold(
      appBar: AppBar(title: Text("Quarta Tela")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          meusTextos("Comandante: $nomeComandante"),
          meusTextos("Tripulantes: $tripulantes"),
          meusTextos("Rota: $distanLuz Anos-Luz em $dias dias"),
          meusTextos("Custo Combustível: $custoCombustivel"),
          meusTextos("Custo Oxigênio: $custOxigenio"),
          meusTextos("Orçamento Total: $orcamenTotal"),
          meusTextos("Verba do Governo: $caixa"),
          meusTextos("Saldo Final: $saldoFinal"),
          
          if (semSaldo)
            meusTextos("Risco Crítico de Falência Financeira!"),

          meusTextos("Fator de Desgaste: $desgaste"),

          if (riscoPane)
            meusTextos("Alerta: Velocidade Alta (Maior que 80%)!"),

          meusTextos("Status: $status"),

          SizedBox(height: 20),

          meusBotoes("Reiniciar Missão", () {
            reiniciarMissao(context);
          }, Colors.white)
        ],
      ),
    );
  }
}