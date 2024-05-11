

class NoteModel {
  NoteModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
  });

  String id;
  String userId;
  String title;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String updatedBy;

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    id: json["id"],
    userId: json["userId"],
    title: json["title"],
    content: json["content"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "title": title,
    "content": content,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "createdBy": createdBy,
    "updatedBy": updatedBy,
  };
}