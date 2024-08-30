import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:everlane_style/data/datasources/cartdatasource.dart';
import 'package:everlane_style/data/models/ordermodel.dart';
import 'package:meta/meta.dart';

import '../../data/models/cartmodel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    final CartDatasource cartDataSource = CartDatasource();
    on<CartEvent>((event, emit) async {
      List<Cart> list = [];
      emit(CartLoading());
      print("mnbvcxx");
      try {
        final List<Cart> result = await cartDataSource.getCart();
        list = result;
        print("lmnopqrst${list.length}");
        if (list.isNotEmpty) {
          emit(CartLoaded(result));
        } else {
          emit(CartLoaded([]));
        }
      } catch (e) {
        print("@@@@@@@@@@@@@@@@@@");
        emit(CartError(e.toString()));
      }
    });
    on<AddToCart>((event, emit) async {
      emit(addtoCartLoading());
      try {
        final cartitems =
            await cartDataSource.postCart(event.productId, event.size);
        print("object${cartitems}");
        if (cartitems == "success") {
          emit(addtoCartSuccess());
        } else {
          emit(addtoCartError(message: cartitems));
        }
      } catch (e) {
        emit(addtoCartError(message: e.toString()));
      }
    },);
    on<RemovefromCart>(
      (event, emit) async {
        emit(RemoveCartLoading());
        try {
          final deleteditems = await cartDataSource.Removecart(event.productId);
          print("deleteditems: $deleteditems");

          if (deleteditems == "success") {
            emit(RemoveCartSuccess(event.productId));
          } else {
            emit(RemoveCartFailure(deleteditems));
          }
        } catch (e) {
          emit(RemoveCartFailure(e.toString()));
        }
      },
    );

    on<PlaceOrder>((event, emit) async {
      emit(palceOrderLoading());
      try {
        final result = await cartDataSource.placeOrder(
            event.paymentMethod, event.orderType, event.deliveryAddressId);
        print("object${result}");
        if (result == "success") {
          emit(placeOrderSuccess());
        } else {
          emit(placeOrdererror(message: result));
        }
      } catch (e) {
        emit(placeOrdererror(message: e.toString()));
      }
    });

    on<IncreaseCartItemQuantity>((event, emit) async {
      try {
        final cartitems = await cartDataSource.updateCartItemQuantity(
            event.cartItemId, event.increase);
        print("object${cartitems}");
        if (cartitems == "success") {
          emit(incrementsuccess());
        } else {
          emit(incrementerror(message: cartitems));
        }
      } catch (e) {
        emit(incrementerror(message: e.toString()));
      }
    });

    on<DecreaseCartItemQuantity>((event, emit) async {
      try {
        final cartitems = await cartDataSource.updateCartItemQuantity(
            event.cartItemId, event.decrease);
        print("object${cartitems}");
        if (cartitems == "success") {
          emit(decrementsuccess());
        } else {
          emit(decrementerror(message: cartitems));
        }
      } catch (e) {
        emit(decrementerror(message: e.toString()));
      }
    });

    on<fetchOrders>((event, emit) async {
      List<Order> list = [];
      emit(OrderLoading());
      print("mnbvcxx");
      try {
        final List<Order> result = await cartDataSource.getOrders();
        list = result;
        print("lmnopqrst${list.length}");
        if (list.isNotEmpty) {
          emit(OrderLoaded(result));
        } else {
          emit(OrderLoaded([]));
        }
      } catch (e) {
        print("@@@@@@@@@@@@@@@@@@");
        emit(OrderError(e.toString()));
      }
    });

    on<ReturnOrder>((event, emit) async {
      emit(Returnloading());
      try {
        final result = await cartDataSource.returnOrder(event.orderItemId ?? 0,
            event.returnQuantity ?? 0, event.returnReason ?? "");
        print("orderitemid${event.orderItemId}");
        print("API call result: $result");
        if (result == "success") {
          emit(ReturnSuccess());
        } else {
          emit(ReturnError(message: result));
        }
      } catch (e) {
        emit(ReturnError(message: e.toString()));
      }
    });
  }
}
