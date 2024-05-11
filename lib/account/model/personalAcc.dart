
class PersonalAccModel {
  final String owner;
  final String name;
  final int pin;

  PersonalAccModel({
    required this.owner,
    required this.name,
    required this.pin,
  });

  factory PersonalAccModel.fromJson(Map<String, dynamic> json) {
    return PersonalAccModel(
      owner: json['owner'],
      name: json['name'],
      pin: json['pin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pin': pin,
    };
  }
}