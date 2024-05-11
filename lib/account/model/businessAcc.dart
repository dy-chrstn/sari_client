
class BusinessAccModel {
  final String userId;
  final String username;
  final String email;

  BusinessAccModel({
    required this.userId,
    required this.username,
    required this.email,
  });

  factory BusinessAccModel.fromJson(Map<String, dynamic> json) {
    return BusinessAccModel(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
    );
  }
}