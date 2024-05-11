

class ProductModel {
  ProductModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.dp,
    required this.srp,
    required this.description,
    required this.imageUrl,
    required this.types,
    required this.sizes,
    required this.prices,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
  });

  String id;
  String userId;
  String name;
  String dp;
  String srp;
  String description;
  String imageUrl;
  List<String> types;
  List<String> sizes;
  List<String> prices;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String updatedBy;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    userId: json["userId"],
    name: json["name"],
    dp: json["dp"],
    srp: json["srp"],
    description: json["description"],
    imageUrl: json["imageUrl"],
    types: List<String>.from(json["types"].map((x) => x)),
    sizes: List<String>.from(json["sizes"].map((x) => x)),
    prices: List<String>.from(json["prices"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "name": name,
    "dp": dp,
    "srp": srp,
    "description": description,
    "imageUrl": imageUrl,
    "types": List<dynamic>.from(types.map((x) => x)),
    "sizes": List<dynamic>.from(sizes.map((x) => x)),
    "prices": List<dynamic>.from(prices.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "createdBy": createdBy,
    "updatedBy": updatedBy,
  };
}