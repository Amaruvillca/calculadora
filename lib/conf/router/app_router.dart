import 'package:calculadora/presentation/screen/calculadora/calculadora_screen.dart';
import 'package:calculadora/presentation/screen/conversor/conversor_creen.dart';
import 'package:calculadora/presentation/screen/conversorgeneral/conversorgeneral_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
  name: CalculadoraScreen.name,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const CalculadoraScreen();
      }),
      GoRoute(
  name: ConversorScreen.name,
      path: '/conversor',
      builder: (BuildContext context, GoRouterState state) {
        return const ConversorScreen();
      }),
      GoRoute(
  name: ConversorgeneralScreen.name,
  path: '/conversor/:tipo', // `:tipo` aceptará cualquier string
  builder: (context, state) {
    final tipo = state.pathParameters['tipo'] ?? 'default'; // Valor por defecto
    return ConversorgeneralScreen(unidad: tipo,);
  },
),
      
      
      ]);