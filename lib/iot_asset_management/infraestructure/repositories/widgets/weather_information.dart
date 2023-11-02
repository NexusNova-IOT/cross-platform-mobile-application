import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, top: 16, bottom: 16), // Padding arriba, izquierda y abajo
      child: Row(
        children: [
          // Imagen del clima a la izquierda
          Image.asset(
            'images/weather.png',
            width: 80, // Ancho de la imagen
            height: 80, // Alto de la imagen
          ),
          SizedBox(width: 20), // Espacio entre la imagen y el texto

          // Temperatura a la derecha
          Text(
            'temperature',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
