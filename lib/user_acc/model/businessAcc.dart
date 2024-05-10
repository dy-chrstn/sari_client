
class BusinessAccModel {
  final String id;
  final String username;
  final String email;
  final String password;

  BusinessAccModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory BusinessAccModel.fromJson(Map<String, dynamic> json) {
    return BusinessAccModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}