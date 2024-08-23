class WhislistProduct {
  final int id;
  final int product;
  final String image;
  final String name;
  final double price;
  final String description;
  final bool isActive;
  final bool isDeleted;
  final DateTime createdOn;

  WhislistProduct({
    required this.id,
    required this.product,
    required this.image,
    required this.description,
    required this.isActive,
    required this.isDeleted,
    required this.createdOn,
    required this.name,
    required this.price,
  });

  factory WhislistProduct.fromJson(Map<String, dynamic> json) {
    return WhislistProduct(
      id: json['id'] != null ? (json['id'] as int) : 0,
      product: json['product'] != null ? (json['product'] as int) : 0,
      isActive: json['is_active'] as bool,
      isDeleted: json['is_deleted'] as bool,
      createdOn: DateTime.parse(json['created_on'] as String),
      image: json['product_image'] as String,
      name: json['product_name'] as String,
      price: (json['product_price'] as num).toDouble(),
      description: json['product_description']as String,
    );
  }
}
