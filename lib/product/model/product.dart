class ProductModel {
  String id;
  String userId;
  String name;
  int dp;
  int srp;
  String description;
  String imageUrl;
  List<String> types;
  List<String> sizes;
  List<int> prices;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String updatedBy;

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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      dp: json['dp'] ?? '',
      srp: json['srp'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      types: (json['types'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      sizes: (json['sizes'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      prices: (List<int>.from(json['price'] ?? [])),
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
      createdBy: json['createdBy'] ?? '',
      updatedBy: json['updatedBy'] ?? '',
    );
  }
}
