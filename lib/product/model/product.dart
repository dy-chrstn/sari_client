class ProductModel {
  String id;
  String userId;
  String name;
  int stock;
  String description;
  String imageUrl;
  List<String> types;
  List<String> sizes;
  List<double> prices;
  List<double> dp;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String updatedBy;

  ProductModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.stock,
    required this.description,
    required this.imageUrl,
    required this.types,
    required this.sizes,
    required this.prices,
    required this.dp,
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
      stock: json['stock'] ?? 0,
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      types: (json['types'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      sizes: (json['sizes'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      prices: (List<double>.from(json['price'] ?? [])),
      dp: (List<double>.from(json['dp'] ?? [])),
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
      createdBy: json['createdBy'] ?? '',
      updatedBy: json['updatedBy'] ?? '',
    );
  }
}
