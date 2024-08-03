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
    on<ProductEvent>((event, emit)async {
      emit(ProductLoading());
      try {
        final products = await productUsecases.getProductFromDatasource();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
