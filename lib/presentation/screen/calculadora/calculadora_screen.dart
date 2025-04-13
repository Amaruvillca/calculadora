import 'package:calculadora/providers/calculadora_probider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculadora/conf/theme/app_theme.dart';
import 'package:animate_do/animate_do.dart';

class CalculadoraScreen extends ConsumerWidget {
  const CalculadoraScreen({super.key});
  static final String name = "calculadora_screen";

  final List<String> buttons = const [
    'AC',
    'DEL',
    '(',
    ')',
    '÷',
    '7',
    '8',
    '9',

    '×',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '.',
    '0',
    '=',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDark);
    final color = Theme.of(context).colorScheme;
    final String operacion = ref.watch(textOperacion);
    final String historialOperacion = ref.watch(historial);
    final int themaSeleccionada = ref.watch(seleccionarThema);
    final altuara = MediaQuery.of(context).size.height;
    final paletaColor = listColor;
    final TextEditingController texto = TextEditingController(text: operacion);

    return Scaffold(
      backgroundColor:
          isDarkMode ? const Color(0xFF1E1E1E) : const Color(0xFFF4F1EE),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      ref.read(isDark.notifier).state = !isDarkMode;
                    },

                    icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
                  ),
                  TextButton(onPressed: () {}
                  ,style: TextButton.styleFrom(
                      backgroundColor: color.primary,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: SlideInRight(
                      child: Text(
                        "Calculadora",
                        style: TextStyle(
                        color: color.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go("/conversor");
                    },
                    child: Text("Conversor"),
                  ),

                  PopupMenuButton<int>(
                    // Set the default selected value to 0
                    icon: const Icon(Icons.more_vert),

                    onSelected: (value) {
                      // Handle the selected value from the radio buttons
                      ref
                          .watch(seleccionarThema.notifier)
                          .update((state) => value);
                    },
                    itemBuilder:
                        (context) => [
                          ...paletaColor.asMap().entries.map(
                            (entry) => PopupMenuItem(
                              value: entry.key,

                              child: Row(
                                children: [
                                  Radio<int>(
                                    value: entry.key,
                                    activeColor: entry.value,

                                    groupValue:
                                        themaSeleccionada, // Replace with a variable to manage state
                                    onChanged: (value) {
                                      // Handle radio button selection
                                    },
                                  ),
                                  Text(
                                    "${entry.hashCode}",
                                    style: TextStyle(color: entry.value),
                                  ), // Display the color or its name
                                ],
                              ),
                            ),
                          ),
                        ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            historialOperacion,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 110, 110, 110),
                            ),
                          ),
                        ),
                        TextField(
                          enableInteractiveSelection: true,
                          readOnly: true,
                          showCursor: true,
                          controller: texto,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0',
                            hintStyle: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: color.primary.withOpacity(0.5),
                            ),
                          ),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: color.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: altuara * 0.65,

              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: GridView.count(
                crossAxisCount: 4,

                shrinkWrap: false,
                physics: const AlwaysScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children:
                    buttons.map((text) {
                      final isOperator = '÷×-+='.contains(text);
                      return SizedBox(
                        child: ElevatedButton(
                          // height: 50, // Uncomment and set a valid height if needed
                          onPressed: () {
                            if (text == "AC") {
                              ref
                                  .watch(textOperacion.notifier)
                                  .update((state) => "");

                              ref
                                  .watch(historial.notifier)
                                  .update((state) => "0");

                              return;
                            }
                            if (operacion == "NaN" || operacion == "Error") {
                              ref
                                  .watch(textOperacion.notifier)
                                  .update((state) => text);

                              return;
                            }

                            if (text != "AC" && text != "DEL") {
                              texto.text = operacion + text;
                              ref
                                  .watch(textOperacion.notifier)
                                  .update((state) => operacion + text);
                            }

                            if (text == "=") {
                              try {
                                String expresionProcesada = operacion
                                    .replaceAll('x', '*')
                                    .replaceAll(
                                      '×',
                                      '*',
                                    ) // por si usas el símbolo "bonito"
                                    .replaceAll('÷', '/');

                                Parser p = Parser();
                                Expression exp = p.parse(expresionProcesada);
                                ContextModel cm = ContextModel();

                                double resultado = exp.evaluate(
                                  EvaluationType.REAL,
                                  cm,
                                );
                                // Resultado: 15.0
                                ref
                                    .watch(textOperacion.notifier)
                                    .update((state) => "$resultado");
                              } catch (e) {
                                ref
                                    .watch(textOperacion.notifier)
                                    .update((state) => "Error");
                              }
                            }

                            try {
                              String expresionProcesada = texto.text
                                  .replaceAll('x', '*')
                                  .replaceAll(
                                    '×',
                                    '*',
                                  ) // por si usas el símbolo "bonito"
                                  .replaceAll('÷', '/');

                              Parser p = Parser();
                              Expression exp = p.parse(expresionProcesada);
                              ContextModel cm = ContextModel();

                              double resultado = exp.evaluate(
                                EvaluationType.REAL,
                                cm,
                              );
                              ref
                                  .watch(historial.notifier)
                                  .update((state) => "$resultado");
                            } catch (e) {}
                            if (text == "DEL") {
                              if (operacion.isNotEmpty) {
                                ref
                                    .watch(textOperacion.notifier)
                                    .update(
                                      (state) => operacion.substring(
                                        0,
                                        operacion.length - 1,
                                      ),
                                    );
                              } else {}
                              return;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isOperator
                                    ? color
                                        .primary // verde para operadores
                                    : isDarkMode
                                    ? const Color(0xFF2C2C2C)
                                    : const Color(0xFFEDEDED),
                            foregroundColor:
                                isOperator
                                    ? Colors.white
                                    : isDarkMode
                                    ? Colors.white
                                    : Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            padding: const EdgeInsets.all(10),

                            elevation: 2,
                          ),
                          child: Text(
                            text,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
