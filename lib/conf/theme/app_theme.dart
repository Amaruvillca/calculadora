

import 'package:flutter/material.dart';

final List<Color> listColor = [
  Color(0xFF1E1E1E), // Fondo general (modo oscuro elegante)
  Color(0xFF2C2C2C), // Fondo de botones
  Color(0xFF00A878), // Botón de igual "=" u operaciones principales
  Color(0xFFEDEDED), // Texto claro en fondo oscuro
  Color(0xFFF7B801), // Botones de operadores secundarios
  Color(0xFF005C43), // Detalles/acento o botón especial
  Color(0xFFB9FBC0), // Colores suaves para resultado o display
  
  Color.fromARGB(255, 221, 21, 21), // Texto claro en botones oscuros
  Color.fromARGB(255, 143, 1, 143),
  Color.fromARGB(255, 87, 81, 1), 
];


class AppTheme {

  final bool isDarck;
  final int seleccionThema;

  AppTheme( {required this.isDarck,this.seleccionThema=0});
  
  ThemeData appTheme(){
   return ThemeData(
useMaterial3: true,
// estableser modo oscuro
brightness: isDarck ? Brightness.dark : Brightness.light,
colorSchemeSeed: listColor[seleccionThema],

   );
   

  }



}