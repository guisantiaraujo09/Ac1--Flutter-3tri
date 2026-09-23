import 'package:flutter/material.dart';

Widget meuTextField(String texto, IconData icone, TextEditingController controle){
  return Padding(
    padding: EdgeInsets.all(10),
    child: TextField(
      controller: controle,
      decoration: InputDecoration(
      labelText: texto,
      prefixIcon: Icon(icone), //Colocar icones na input
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), //Deixar a borda mais redondas
        )
      ),
    ),
  );
}