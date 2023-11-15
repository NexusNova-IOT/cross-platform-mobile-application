import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomRectangle extends StatelessWidget {
  final String date;

  CustomRectangle({required this.date});

  @override
  Widget build(BuildContext context) {
    DateTime dateConverted = DateTime.parse(date);
    String formattedDate = DateFormat('MM/dd/yyyy - HH:mm:ss').format(dateConverted);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: const BorderSide(
          color: Colors.black,
          width: 3.0,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFFDDDDDD),
        ),
        child: Row(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 50.0, left: 25.0),
                  child: Text(
                    formattedDate,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: 35,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  color: Color(0xFF444444),
                ),
                child: const Center(
                  child: Text(
                    'In Progress',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
