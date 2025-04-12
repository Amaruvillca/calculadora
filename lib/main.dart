import 'package:calculadora/conf/theme/app_theme.dart';
import 'package:calculadora/presentation/screen/calculadora/calculadora_screen.dart';
import 'package:calculadora/providers/calculadora_probider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
  const ProviderScope(
      child: MyApp(),
    ),
  
  );

class MyApp extends ConsumerWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    final isDarkMode = ref.watch(isDark);
    final colorseleccionado = ref.watch(seleccionarThema);
    return MaterialApp(
      theme: AppTheme(isDarck: isDarkMode,seleccionThema: colorseleccionado).appTheme(),
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      home: CalculadoraScreen(),
    );
  }
}