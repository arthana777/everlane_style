part of 'cart_bloc.dart';

@immutable
sealed class CartState extends Equatable{}

final class CartInitial extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class CartLoading extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CartLoaded extends CartState {
  final List<Cart> carts;

  CartLoaded(this.carts);

  @override
  List<Object> get props => [carts];
}

class CartError extends CartState {
  final String message;

  CartError(this.message);

  @override
  List<Object> get props => [message];
}

class addtoCartInitial extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class addtoCartLoading extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class addtoCartSuccess extends CartState {
  @override
  // final List<Cart> carts; // Assuming you have a Cart model
  //
  // addtoCartSuccess({required this.carts});

  @override
  List<Object?> get props => [];
}

class addtoCartError extends CartState {
  @override
  final String message;

   addtoCartError({required this.message});

  @override
  List<Object?> get props => [message];
}


class RemoveCartLoading extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class RemoveCartSuccess extends CartState {
  final int removedProductId;
  RemoveCartSuccess(this.removedProductId);
  List<Object> get props => [removedProductId];
}

class RemoveCartFailure extends CartState {
  final String error;
  RemoveCartFailure(this.error);
  @override
  List<Object> get props => [];
}




class palceOrderLoading extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class placeOrderSuccess extends CartState {
  @override
  // final List<Cart> carts; // Assuming you have a Cart model
  //
  // addtoCartSuccess({required this.carts});

  @override
  List<Object?> get props => [];
}

class placeOrdererror extends CartState {
  @override
  final String message;

  placeOrdererror({required this.message});

  @override
  List<Object?> get props => [message];
}








