class WhislistProduct {
  final int id;
  final int product;
  final bool isActive;
  final bool isDeleted;
  final DateTime createdOn;

  WhislistProduct({
    required this.id,
    required this.product,
    required this.isActive,
    required this.isDeleted,
    required this.createdOn,
  });

  factory WhislistProduct.fromJson(Map<String, dynamic> json) {
    return WhislistProduct(
      id: json['id'],
      product: json['product'],
      isActive: json['is_active'],
      isDeleted: json['is_deleted'],
      createdOn: DateTime.parse(json['created_on']),
    );
  }
}
