import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDark = StateProvider((ref) {
  final brightness = WidgetsBinding.instance.window.platformBrightness;
  return brightness == Brightness.dark;
});
final textOperacion = StateProvider((value)=>"");
final historial = StateProvider((value)=>"0");

final seleccionarThema = StateProvider((value)=>0);