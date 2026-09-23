import 'package:ac01_3tri_4telas/widgets/meusBotoes.dart';
import 'package:flutter/material.dart';
import 'segundaTela.dart';
import 'widgets/meusTextfields.dart';

class TelaInicial extends StatelessWidget {
  TelaInicial({super.key});

  final nomeComandante = TextEditingController();
  final quantTripulantes = TextEditingController();
  final distanciaLuz =TextEditingController();

  void abrirSegundaTela(BuildContext context) {
  int tripulantes = int.tryParse(quantTripulantes.text)?? 0;
  double distanLuz = double.tryParse(distanciaLuz.text)?? 0;

  if (nomeComandante.text =="") {
    meuSnackbar("Digite o nome do comandante", context);
    return;
  }
  if (tripulantes <=0) {
    meuSnackbar("Digite a quantidade de trpulantes", context);
    return;
  }
  if (distanLuz <=0) {
    meuSnackbar("Digite a distancia em anos luz", context);
    return;
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SegundaTela(
        nomeComandante: nomeComandante.text,
        tripulantes: tripulantes,
        distanLuz: distanLuz,
      ),
    ),
  ); 
  }
  void meuSnackbar(String mensagem, BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      content: Text(mensagem),
      duration: Duration(seconds: 3),
      backgroundColor: const Color.fromARGB(255, 144, 22, 3),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela Inicial")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            meuTextField("Digite o nome do comandante", Icons.person, nomeComandante),
            meuTextField("Digite a quantidade de tripulantes", Icons.group, quantTripulantes),
            meuTextField("Digite a distancia do destino em anos luz", Icons.flight, distanciaLuz),
    
            meusBotoes("Avançar para Recursos", () {abrirSegundaTela(context);}, Colors.white)
          ],
        ),
      ),
    );
  }
}