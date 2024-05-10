
class PersonalAccModel {
  final String id;
  final String name;
  final String pin; 

  PersonalAccModel({
    required this.id,
    required this.name,
    required this.pin,
  });

  factory PersonalAccModel.fromJson(Map<String, dynamic> json) {
    return PersonalAccModel(
      id: json['id'],
      name: json['name'],
      pin: json['pin'],
    );
  }
}