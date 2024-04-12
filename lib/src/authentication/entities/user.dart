class User {
  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.password,
      required this.createdAt,
      required this.updatedAt});

  final Object id;
  final String username;
  final String email;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;
}
