import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{
  @override
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final int? subcategory;
  final String? image;
  final bool isTrending;
  final bool summer;
  final bool winter;
  final bool rainy;
  final bool autumn;
  ProductEntity({this.id,
      this.name,
      this.description,
      this.price,
      this.subcategory,
      this.image,
      required this.isTrending,
      required this.summer,
      required this.winter,
      required this.rainy,
      required this.autumn});

  List<Object?> get props => [name,id,image,description];

}