
class PersonalAccModel {
  final String id;
  final String owner;
  final String name;
  final String pin;

  PersonalAccModel({
    required this.id,
    required this.owner,
    required this.name,
    required this.pin,
  });

  factory PersonalAccModel.fromJson(Map<String, dynamic> json) {
    return PersonalAccModel(
      id: json['_id'],
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