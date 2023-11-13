import 'package:flutter/material.dart';
import 'package:life_travel/tour_packages/infraestructure/repositories/widgets/CustomRectangle.dart';
import 'package:life_travel/tour_packages/infraestructure/repositories/widgets/tour_package_detail.dart';

class ItineraryItem extends StatelessWidget {
  final String Title;
  final String agency;
  final String imgUrl;

  const ItineraryItem({
    required this.Title,
    required this.agency,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CustomRectangle(),
          Card(
            color: const Color(0xFF161D2F),
            elevation: 0, // Sin sombra
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8, left: 8),
                    child: Text(
                      Title,
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
                      agency,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xFF5A5A5A)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TourPackageDetail()),
                      );
                    },
                    child: const Text(
                      'See more',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              trailing: Container(
                width: 120,
                height: 120,
                child: Center(
                  child: Image.network(
                    imgUrl,
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