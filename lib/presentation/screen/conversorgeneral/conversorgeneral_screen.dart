import 'package:flutter/material.dart';

class ConversorgeneralScreen extends StatelessWidget {
  static final String name = "conversorgeneral_screen";
  final String unidad;
  const ConversorgeneralScreen({super.key, this.unidad = "sin datos"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(unidad), centerTitle: true),
      body: _Conversor(unidad),
    );
  }
}

class _Conversor extends StatefulWidget {
  final String unidad;

  const _Conversor(this.unidad);

  @override
  State<_Conversor> createState() => _ConversorState();
}

class _ConversorState extends State<_Conversor> {
  final List<String> buttons = const [
    'AC',
    'DEL',
    '7',
    '8',
    '9',
    '4',
    '5',
    '6',
    '1',
    '2',
    '3',
    '.',
    '0',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    List<String> uniMedidas =
        widget.unidad == 'Divisas'
            ? ["Selecione", 'USD', 'EUR', 'JPY', 'GBP']
            : widget.unidad == 'Longitud'
            ? ["Selecione", 'Metros', 'Kilómetros', 'Millas', 'Pulgadas']
            : widget.unidad == 'Masa'
            ? ["Selecione", 'Gramos', 'Kilogramos', 'Libras', 'Onzas']
            : widget.unidad == 'Área'
            ? [
              "Selecione",
              'Metros cuadrados',
              'Hectáreas',
              'Acres',
              'Pies cuadrados',
            ]
            : widget.unidad == 'Tiempo'
            ? ["Selecione", 'Segundos', 'Minutos', 'Horas', 'Días']
            : widget.unidad == 'Datos'
            ? ["Selecione", 'Bytes', 'Kilobytes', 'Megabytes', 'Gigabytes']
            : widget.unidad == 'Descuento'
            ? ["Selecione", 'Porcentaje', 'Decimal']
            : widget.unidad == 'Volumen'
            ? ["Selecione", 'Litros', 'Mililitros', 'Galones', 'Onzas líquidas']
            : widget.unidad == 'Sistema numérico'
            ? ["Selecione", 'Binario', 'Octal', 'Decimal', 'Hexadecimal']
            : widget.unidad == 'Velocidad'
            ? [
              "Selecione",
              'Metros/segundo',
              'Kilómetros/hora',
              'Millas/hora',
              'Nudos',
            ]
            : widget.unidad == 'Temperatura'
            ? ["Selecione", 'Celsius', 'Fahrenheit', 'Kelvin']
            : widget.unidad == 'IMC'
            ? ["Selecione", 'Peso (kg)', 'Altura (m)']
            : ["JUAN", "JUAN"];
    final color = Theme.of(context).colorScheme;
    final TextEditingController texto = TextEditingController();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextField(
                      enableInteractiveSelection: true,
                      readOnly: true,
                      showCursor: true,
                      controller: texto,
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintText: '0',
                        hintStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: color.primary.withOpacity(0.5),
                        ),
                      ),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: color.primary,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(20),
                      color:  Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.05),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: DropdownButton<String>(
                      value: "Selecione",
                      items:
                          <String>[...uniMedidas].map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style: TextStyle(fontSize: 20,color:color.primary),),
                                
                              );
                            },
                          ).toList(),
                      onChanged: (String? newValue) {
                        // Handle change
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text("hola ",style: TextStyle(fontSize: 30),)
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(20),
                      color:  Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.05),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: DropdownButton<String>(
                      value: "Selecione",
                      items:
                          <String>[...uniMedidas].map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style: TextStyle(fontSize: 20,color:color.primary),),
                                
                              );
                            },
                          ).toList(),
                      onChanged: (String? newValue) {
                        // Handle change
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextField(
                      enableInteractiveSelection: true,
                      readOnly: true,
                      showCursor: true,
                      controller: texto,
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintText: '0',
                        hintStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: color.primary.withOpacity(0.5),
                        ),
                      ),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: color.primary,
                      ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(20),
                      color:  Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.05),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: DropdownButton<String>(
                      value: "Selecione",
                      items:
                          <String>[...uniMedidas].map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style: TextStyle(fontSize: 20,color:color.primary),),
                                
                              );
                            },
                          ).toList(),
                      onChanged: (String? newValue) {
                        // Handle change
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: Text(
                      buttons[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
