class User {
  final String name;
  final String email;
  final String role;

  User({
    required this.name,
    required this.email,
    required this.role,
  });
}

class IdentityAcessServices {
  final String _BaseURL = "https://lifetravel-iot-backend.azurewebsites.net";
}
