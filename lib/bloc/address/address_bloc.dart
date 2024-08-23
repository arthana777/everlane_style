import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:everlane_style/donation/upload_clothes.dart';
import 'package:meta/meta.dart';

import '../../data/datasources/useraddress_datasourse.dart';
import '../../data/models/addressmodel.dart';
import '../../data/models/disastermodel.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressInitial()) {
    UseraddressDatasourse useraddressDatasourse=UseraddressDatasourse();
    on<FetchUserAddresses>((event, emit) async {
      List<UserAddress> list=[];
      emit(AddressLoading());
      print("mnbvcxx");
      try {
        final result = await useraddressDatasourse.getAddress();

        list=result;
        print("@D@D@D${list.length}");
        if(list.isNotEmpty){
          emit(AddressLoaded(userAddresses: result));
        }
      } catch (e) {
        print("kikikikkiki");
        emit(AddressError(message: e.toString()));
      }
    });


    on<CreateAddress>((event,emit) async {
      emit(AddressLoading());
      try {
        final addresses = await useraddressDatasourse.createAddress(
            event.mobile, event.pincode, event.locality, event.address, event.city,
            event.state, event.landmark, event.isDefault, event.isActive, event.isDeleted);
        print("object${addresses}");
        if(addresses=="success"){
          emit(AddressCreationSuccess());
        }
        else{
          emit(AddressError(message:  e.toString(),));
        }
      } catch (e) {
        emit(AddressError( message: e.toString(),));
      }
    });

    on<DeleteAddress>((event, emit) async {
      emit((AddressLoading()));
      try {
        final deleteditems = await useraddressDatasourse.DeleteAddress(event.addressId);
        print("deleteditems: $deleteditems");

        if (deleteditems == "success") {
          emit(DeleteAdresssuccess(event.addressId));  // Simplified success state
        } else {
          emit(AddressError(message: e.toString(),));  // Emitting the failure with the message
        }
      } catch (e) {
        emit(AddressError( message: e.toString(),));
      }
    });

    on<DisasterReg>((event,emit) async {
      emit(AddressLoading());
      try {
        final addresses = await useraddressDatasourse.DisasterReg(
             event.name,
            event.adhar, event.location, event.description,
            event.requiredKidsDresses,event.requiredMenDresses,event.requiredWomenDresses);
        print("object${addresses}");
        if(addresses=="success"){
          emit(DisasteregSuccess());
        }
        else{
          emit(AddressError(message:  e.toString(),));
        }
      } catch (e) {
        emit(AddressError( message: e.toString(),));
      }
    });

    on<FetchDisaster>((event, emit) async {
      List<Disaster> list=[];
      emit(AddressLoading());
      print("mnbvcxx");
      try {
        final result = await useraddressDatasourse.getDisasterlist();

        list=result;
        print("@D@D@D${list.length}");
        if(list.isNotEmpty){
          emit(DisasterLoaded(result));
        }
      } catch (e) {
        print("kikikikkiki");
        emit(AddressError(message: e.toString()));
      }
    });

    on<uploadclothes>((event,emit) async {
      emit(AddressLoading());
      try {
        final addresses = await useraddressDatasourse.uploadCloths();
        print("object${addresses}");
        if(addresses=="success"){
          emit(uploadclothesuccess());
        }
        else{
          emit(AddressError(message:  e.toString(),));
        }
      } catch (e) {
        emit(AddressError( message: e.toString(),));
      }
    });

  }
}
