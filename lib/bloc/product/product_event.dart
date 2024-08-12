part of 'product_bloc.dart';



@immutable
abstract class ProductEvent extends Equatable {
   CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {
  @override
  CategoryEvent() {
    // TODO: implement CategoryEvent
    throw UnimplementedError();
  }
}


