import 'package:flutter/material.dart';
import 'package:life_travel/tour_packages/presentation/CustomRectangle.dart';

class ItineraryItem extends StatefulWidget {
  @override
  _ItineraryItemState createState() => _ItineraryItemState();
}

class _ItineraryItemState extends State<ItineraryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CustomRectangle(),
          Card(
            color: Color(0xFF161D2F),
            elevation: 0, // Sin sombra
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(8),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8, left: 8),
                    child: Text(
                      'MACHU PICCHU',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8, left: 8),
                    child: Text(
                      'Cusco',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xFF5A5A5A),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          'See more',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              trailing: Container(
                width: 120,
                height: 120,
                child: Center(
                  child: Image.asset(
                    'images/profile_image.png',
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
