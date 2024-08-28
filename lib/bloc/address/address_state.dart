part of 'address_bloc.dart';

@immutable
sealed class AddressState extends Equatable{}

final class AddressInitial extends AddressState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class AddressLoading extends AddressState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddressLoaded extends AddressState {
  final List<UserAddress> userAddresses;

   AddressLoaded({required this.userAddresses});

  @override
  List<Object> get props => [userAddresses];
}

class AddressError extends AddressState {
  final String message;

  AddressError({required this.message});

  @override
  List<Object> get props => [message];
}

class AddressCreationSuccess extends AddressState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class DeleteAdresssuccess extends AddressState {
  final int addressid;
  DeleteAdresssuccess(this.addressid);
  List<Object> get props => [addressid];
}

class DisasteregSuccess extends AddressState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DisasterLoaded extends AddressState {
  final List<Disaster> disaster;

  DisasterLoaded(this.disaster);

  @override
  List<Object> get props => [disaster];
}

class uploadclothesuccess extends AddressState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class Pickuploading extends AddressState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Pickuploaded extends AddressState {
  final List<PickupLocation> pickuplocations;

  Pickuploaded({required this.pickuplocations});

  @override
  List<Object> get props => [pickuplocations];
}

class PickupError extends AddressState {
  final String message;

  PickupError({required this.message});

  @override
  List<Object> get props => [message];
}


