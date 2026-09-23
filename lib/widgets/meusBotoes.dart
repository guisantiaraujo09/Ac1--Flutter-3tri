import 'package:flutter/material.dart';

Widget meusBotoes(String texto, VoidCallback onPressed, Color cor){
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: cor
      ),
      onPressed: onPressed,
      child: Text(texto,
      style: TextStyle(
        color: Colors.black)
      ),
      ),
    );
}