import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:life_travel/identity_access_management/presentation/identity_access.dart';
import 'package:intl/intl.dart';
import 'package:life_travel/profile_management/domain/entities/tourist_profile.dart';

class TouristProfileWidget extends StatelessWidget {
  final TouristProfile userProfile;
  final TextEditingController _nameController;
  final TextEditingController _phoneController;
  final TextEditingController _emailController;
  final TextEditingController _birthDateController;
  final TextEditingController _emergencyPhoneNumberController;

  TouristProfileWidget({super.key, required this.userProfile})
      : _nameController = TextEditingController(text: userProfile.name),
        _phoneController = TextEditingController(text: userProfile.phoneNumber),
        _emailController = TextEditingController(text: userProfile.email),
        _birthDateController =
            TextEditingController(text: _formatDate(userProfile.birthDate)),
        _emergencyPhoneNumberController =
            TextEditingController(text: userProfile.emergencyPhoneNumber);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 0.0, top: 50.0, bottom: 50.0),
            color: const Color(0xFF161D2F),
            width: double.infinity,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(userProfile.touristPhotoUrl),
                ),
                const SizedBox(height: 10.0),
                Text(
                  userProfile.name,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Tourist',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.white,
            child: Column(
              children: [
                _buildTextField('Name', _nameController),
                const SizedBox(height: 10.0),
                _buildTextField('Phone', _phoneController),
                const SizedBox(height: 10.0),
                _buildTextField('Email', _emailController),
                const SizedBox(height: 10.0),
                _buildTextField('Birth Date', _birthDateController),
                const SizedBox(height: 10.0),
                _buildTextField(
                    'Emergency Phone Number', _emergencyPhoneNumberController),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              } catch (e) {
                throw Exception("Error al cerrar sesión: $e");
              }
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  static String _formatDate(String date) {
    final parsedDate = DateTime.parse(date);
    final formatter = DateFormat.yMd();
    return formatter.format(parsedDate);
  }
}
