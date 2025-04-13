import 'package:calculadora/providers/calculadora_probider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:calculadora/conf/theme/app_theme.dart';
import 'package:animate_do/animate_do.dart';

class ConversorScreen extends ConsumerWidget {
  static final String name = "conversor_screen";
  const ConversorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDark);
    final color = Theme.of(context).colorScheme;

    final int themaSeleccionada = ref.watch(seleccionarThema);

    final paletaColor = listColor;

    return Scaffold(
      backgroundColor:
          isDarkMode ? const Color(0xFF1E1E1E) : const Color(0xFFF4F1EE),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                  TextButton(
                    
                    onPressed: () {
                      context.go("/");
                    },
                    child: Text("Calculadora"),
                  ),
                    TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: color.primary,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: SlideInLeft(
                      child: Text(
                        "Conversor",
                        style: TextStyle(
                        color: color.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        ),
                      ),
                    ),
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
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 columns
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio:
                    1.0, // Ensures the icon and text are vertically aligned
              ),
              itemCount: 12, // Total of 12 items
              itemBuilder: (context, index) {
                final List<Map<String, dynamic>> units = [
                  {'icon': Icons.attach_money, 'label': 'Divisas'},
                  {'icon': Icons.straighten, 'label': 'Longitud'},
                  {'icon': Icons.monitor_weight, 'label': 'Masa'},
                  {'icon': Icons.square_foot, 'label': 'Área'},
                  {'icon': Icons.access_time, 'label': 'Tiempo'},
                  {'icon': Icons.memory, 'label': 'Datos'},
                  {'icon': Icons.percent, 'label': 'Descuento'},
                  {'icon': Icons.check_box_outline_blank_sharp, 'label': 'Volumen'},
                  {'icon': Icons.calculate, 'label': 'Sistema numérico'},
                  {'icon': Icons.speed, 'label': 'Velocidad'},
                  {'icon': Icons.thermostat, 'label': 'Temperatura'},
                  {'icon': Icons.fitness_center, 'label': 'IMC'},
                ];

                return TextButton(
                  onPressed: (){
                    context.push("/conversor/${units[index]['label']}");
                  },
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Icon(
                      units[index]['icon'],
                      size: 40.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      units[index]['label'],
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ],
                  ),

                );
                
                
                /*Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Icon(
                      units[index]['icon'],
                      size: 40.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      units[index]['label'],
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );*/
              },
            ),
          ],
        ),
      ),
    );
  }
}
