import 'package:equatable/equatable.dart';

abstract class NotificationBlocEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchNotifications extends NotificationBlocEvent {}
