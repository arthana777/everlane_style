class ProductModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final int subcategory;
  final String? image;
  final bool isTrending;
  final bool summer;
  final bool winter;
  final bool rainy;
  final bool autumn;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.subcategory,
    this.image,
    required this.isTrending,
    required this.summer,
    required this.winter,
    required this.rainy,
    required this.autumn,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      subcategory: json['subcategory'],
      image: json['image'],
      isTrending: json['is_trending'],
      summer: json['summer'],
      winter: json['winter'],
      rainy: json['rainy'],
      autumn: json['autumn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'subcategory': subcategory,
      'image': image,
      'is_trending': isTrending,
      'summer': summer,
      'winter': winter,
      'rainy': rainy,
      'autumn': autumn,
    };
  }


  }


