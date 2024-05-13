
class BusinessModelBloc {
  final String userId;
  final String username;
  final String email;
  final String password;

  BusinessModelBloc({
    required this.userId,
    required this.username,
    required this.email,
    required this.password,
  });

  factory BusinessModelBloc.fromJson(Map<String, dynamic> json) {
    return BusinessModelBloc(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}