part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categories;
  const CategoryLoaded(this.categories, );
}

class CategoryError extends CategoryState {
  final String message;
  const CategoryError(this.message);
}
class SubCategoryInitial extends CategoryState {}

class SubCategoryLoading extends CategoryState {
}

class SubCategoryLoaded extends CategoryState {

  final List<CategoryEntity> subcategories;
  const SubCategoryLoaded( this.subcategories);

}

class SubCategoryError extends CategoryState {
  final String message;
  const SubCategoryError(this.message);
}
