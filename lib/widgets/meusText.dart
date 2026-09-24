import 'package:flutter/material.dart';

Widget meusTextos(String texto){
  return Padding(
    padding: const EdgeInsetsGeometry.fromLTRB(50, 10, 10, 5),
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