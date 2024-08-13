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
      id: json['id'],
      product: json['product'],
      isActive: json['is_active'],
      isDeleted: json['is_deleted'],
      createdOn: DateTime.parse(json['created_on']),
      image: json['product_image'],
      name: json['product_name'],
      price: json['product_price'],
      description: json['product_description'],
    );
  }
}
