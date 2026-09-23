import 'package:flutter/material.dart';

Widget meusTextos(String texto){
  return Padding(
    padding: const EdgeInsetsGeometry.fromLTRB(75, 10, 15, 10),
    child: Text(
      texto,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Arial',
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    ),
  );
}