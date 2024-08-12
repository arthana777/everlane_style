import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:everlane_style/domain/usecases/product_usecases.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/product_entity.dart';

part 'product_event.dart';
part 'product_state.dart';
class ProductBloc extends Bloc<ProductEvent, ProductState> {


  ProductBloc() : super(ProductInitial()) {
    ProductUsecases productUsecases=ProductUsecases();
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await productUsecases.getProductFromDatasource();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<LoadSeasons>((event, emit) async {
      emit(SeasonsLoading());
      try {
        final seasons = await productUsecases.getSeasonsfromDatasource(event.season);
        emit(SeasonsLoaded(seasons));
      } catch (e) {
        emit(SeasonError(e.toString()));
      }
    });
    on<Loadfiltercategories>((event, emit) async {
      emit(filtercategoryLoading());
      try {
        final filtercategories = await productUsecases.getfiltercategoryDatasource(event.id);
        emit(filtercategoryLoaded(filtercategories));
      } catch (e) {
        emit(filtercategoryError(e.toString()));
      }
    });

    on<LoadDetails>((event, emit) async {
      emit(DetailsLoading());
      try {
        final productdetails = await productUsecases.getDetailsProductDatasource(event.id);
        emit(DetailsLoaded(productdetails));
      } catch (e) {
        emit(DetailsError(e.toString()));
      }
    });
  }
}