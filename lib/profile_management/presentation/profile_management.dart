import 'package:flutter/material.dart';

import '../../common/widgets/bottom_nav.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int _selectedIndex = 0;

  void handleIndexChanged(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        Container(
        padding: EdgeInsets.only(left: 0.0, top: 50.0, bottom: 50.0),
        decoration: BoxDecoration(
          color: Color(0xFF161D2F), // Color de fondo del contenedor secundario
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
          child: Stack(
            children: [
              // Botón de retroceso
              Container(
                margin: EdgeInsets.only(left: 20.0, top: 10.0), // Margen desde la izquierda y desde arriba
                child: CircleAvatar(
                  backgroundColor: Colors.white, // Color de fondo del círculo
                  radius: 20.0, // Radio del círculo
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      // Maneja la acción de retroceso
                    },
                    color: Colors.black, // Color del icono
                  ),
                ),
              ),
              // Imagen de perfil, nombre y rol
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/images/profile_image.png'),
                    ),
                    Text(
                      "Nombre del Usuario",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Tipo de Rol",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
            color: Colors.white, // Fondo blanco del contenedor principal
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black, // Color del borde
                        width: 2.0, // Grosor del borde
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black, // Color del borde
                        width: 2.0, // Grosor del borde
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0), // Separación entre los TextFormField
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Apellido',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black, // Color del borde
                        width: 2.0, // Grosor del borde
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black, // Color del borde
                        width: 2.0, // Grosor del borde
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0), // Separación entre los TextFormField
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Móvil',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black, // Color del borde
                        width: 2.0, // Grosor del borde
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black, // Color del borde
                        width: 2.0, // Grosor del borde
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0), // Separación entre los TextFormField
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black, // Color del borde
                        width: 2.0, // Grosor del borde
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black, // Color del borde
                        width: 2.0, // Grosor del borde
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: handleIndexChanged, // Pasa la función
      ),
    );
  }
}
