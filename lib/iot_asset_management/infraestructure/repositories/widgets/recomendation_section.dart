import 'package:flutter/material.dart';

class RecommendationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Sección de Ropa
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding izquierda y derecha
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF25858), // Fondo de color #F25858
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.local_mall, // Icono de ropa
                    color: Colors.black, // Icono en negro
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Clothes',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('• Bullet Point 1'),
                Text('• Bullet Point 2'),
                Text('• Bullet Point 3'),
                Text('• Bullet Point 4'),
              ],
            ),
          ],
        ),

        SizedBox(height: 16),

        Row(
          children: [
            // Sección de Sombrilla
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding izquierda y derecha
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF54A9E7), // Fondo de color #54A9E7
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.beach_access, // Icono de sombrilla
                    color: Colors.black, // Icono en negro
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trip Objects',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('• Bullet Point 1'),
                Text('• Bullet Point 2'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
