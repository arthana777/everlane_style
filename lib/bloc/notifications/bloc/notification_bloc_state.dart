import 'package:equatable/equatable.dart';
import 'package:everlane_style/data/models/notification_model.dart';

abstract class NotificationBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationBlocState {}

class NotificationLoading extends NotificationBlocState {}

class NotificationLoaded extends NotificationBlocState {
  final List<NotificationModel> notifications;

  NotificationLoaded(this.notifications);

  @override
  List<Object> get props => [notifications];
}

class NotificationError extends NotificationBlocState {
  final String message;

  NotificationError(this.message);

  @override
  List<Object> get props => [message];
}
