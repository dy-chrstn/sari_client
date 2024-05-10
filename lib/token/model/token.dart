class TokenModel{
  final String token;

  TokenModel({
    required this.token
  });

  factory TokenModel.fromJson(String json) {
    return TokenModel(
      token: json,
    );
  }
}