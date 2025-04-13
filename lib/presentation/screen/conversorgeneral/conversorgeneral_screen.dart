import 'package:flutter/material.dart';

class ConversorgeneralScreen extends StatelessWidget {
  static final String name ="conversorgeneral_screen";
  final String unidad;
  const ConversorgeneralScreen({super.key, this.unidad="sin datos"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(unidad),
        centerTitle: true,
      ),
      body: _Conversor(unidad),

    );
  }
}

class _Conversor extends StatelessWidget {
  final String unidad;

  const _Conversor(this.unidad);

  @override
  Widget build(BuildContext context) {
     List<String> uniMedidas = 
      unidad == 'Divisas' ? ["Selecione",'USD', 'EUR', 'JPY', 'GBP'] :
      unidad == 'Longitud' ? ["Selecione",'Metros', 'Kilómetros', 'Millas', 'Pulgadas'] :
      unidad == 'Masa' ? ["Selecione",'Gramos', 'Kilogramos', 'Libras', 'Onzas'] :
      unidad == 'Área' ? ["Selecione",'Metros cuadrados', 'Hectáreas', 'Acres', 'Pies cuadrados'] :
      unidad == 'Tiempo' ? ["Selecione",'Segundos', 'Minutos', 'Horas', 'Días'] :
      unidad == 'Datos' ? ["Selecione",'Bytes', 'Kilobytes', 'Megabytes', 'Gigabytes'] :
      unidad == 'Descuento' ? ["Selecione",'Porcentaje', 'Decimal'] :
      unidad == 'Volumen' ? ["Selecione",'Litros', 'Mililitros', 'Galones', 'Onzas líquidas'] :
      unidad == 'Sistema numérico' ? ["Selecione",'Binario', 'Octal', 'Decimal', 'Hexadecimal'] :
      unidad == 'Velocidad' ? ["Selecione",'Metros/segundo', 'Kilómetros/hora', 'Millas/hora', 'Nudos'] :
      unidad == 'Temperatura' ? ["Selecione",'Celsius', 'Fahrenheit', 'Kelvin'] :
      unidad == 'IMC' ? ["Selecione",'Peso (kg)', 'Altura (m)'] :
      ["JUAN","JUAN"];
      



    
    return  Center(
      child: Column(
        
        children: [
          
            Row(
              children: [
                DropdownButton<String>(
                value: "Selecione",
                items: <String>[
                  ...uniMedidas
                ]
                  .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle change
                },
                ),
                TextButton(onPressed: (){}, child: Text("data"))
                
                
              ],
            ),
            DropdownButton<String>(
            value: "Selecione",
            items: <String>[...uniMedidas]
              .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle change
            },
            ),
        ],
      ),
    );
  }
}