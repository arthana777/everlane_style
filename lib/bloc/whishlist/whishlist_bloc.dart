import 'dart:math';

import 'package:everlane_style/bloc/whishlist/whishlist_event.dart';
import 'package:everlane_style/bloc/whishlist/whishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/whislist_datasource.dart';

class WhishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WhishlistBloc() : super(WishlistInitial()) {
   WhishlistDatasource wishlistdatasource = WhishlistDatasource();
    on<AddToWishlist>((event, emit) async {
      emit(addtoWishlistLoading());
      try {
        final whilistitems = await wishlistdatasource.addToWishlist(event.productId);
        print("object${whilistitems}");
        if(whilistitems=="success"){
          emit(addtoWishlistSuccess());
        }
        else{
          emit(addtoWishlistFailure(whilistitems));
        }
      } catch (e) {
        emit(addtoWishlistFailure(e.toString()));
      }
    });
   on<RetrieveWhishlist>((event, emit) async {
     emit(WishlistLoading());
     try {
       final result = await wishlistdatasource.getWhishlist();
           print("resultttt${result}");
           if(result=="success"){
             emit(WishlistSuccess(result));
           }
     } catch (e) {
       emit(WishlistFailure());
     }
   });
   // on<RetrieveWhishlist>((event, emit) async {
   //   emit(WishlistLoading());
   //   try {
   //     final result = await wishlistdatasource.getWhishlist();
   //     print("resultttt${result}");
   //     if(result=="success"){
   //       emit(WishlistSuccess(result));
   //     }
   //     else{
   //       emit(WishlistFailure());
   //     }
   //   } catch (e) {
   //     emit(WishlistFailure());
   //   }
   // });

  }
}