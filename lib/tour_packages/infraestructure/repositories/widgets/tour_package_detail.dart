import 'package:flutter/material.dart';

import '../../../../common/widgets/life_travel_app_bar.dart';

class TourPackageDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LifeTravelAppBar(),
      body: Column(
          children: [
          const SizedBox(height: 15.0),
      const Text(
        'Itinerary',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Título del paquete',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Color(0xFF161D2F),

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Machu Picchu',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Inka Trek',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '3:40 PM',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Text(
                  'Actividades:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    )
    ]
    ));

  }
}
