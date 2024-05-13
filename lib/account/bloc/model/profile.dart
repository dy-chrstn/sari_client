
class PersonalAccBloc {
  final String owner;
  final String name;
  final int pin;
  final String password;

  PersonalAccBloc({
    required this.owner,
    required this.name,
    required this.pin,
    required this.password,
  });

  factory PersonalAccBloc.fromJson(Map<String, dynamic> json) {
    return PersonalAccBloc(
      owner: json['owner'],
      name: json['name'],
      pin: json['pin'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pin': pin,
      'password': password
    };
  }
}