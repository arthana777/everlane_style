import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:everlane_style/domain/entities/category_entity.dart';
import 'package:everlane_style/domain/usecases/category_usecases.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  CategoryBloc() : super(CategoryInitial()) {
     CategoryUsecases categoryUsecases=CategoryUsecases();
    on<LoadCategories>((event, emit) async {
      emit(CategoryLoading());
      try {
        final categories = await categoryUsecases.getCategoryFromDataSource();
        emit(CategoryLoaded(categories));
      } catch (e) {
        emit(CategoryError(e.toString()));
      }
    });
     on<LoadSubCategories>((event, emit,) async {
       emit(SubCategoryLoading());
       try {
         final subcategories = await categoryUsecases.getSubCategoryFromDataSource(event.id);
         emit(SubCategoryLoaded(subcategories));
       } catch (e) {
         emit(SubCategoryError(e.toString()));
       }
     });
  }
}
