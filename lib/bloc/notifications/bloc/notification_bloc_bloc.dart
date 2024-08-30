import 'package:everlane_style/bloc/notifications/bloc/notification_bloc_event.dart';
import 'package:everlane_style/bloc/notifications/bloc/notification_bloc_state.dart';
import 'package:everlane_style/data/datasources/notification_service.dart';
import 'package:everlane_style/data/models/notification_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBlocBloc
    extends Bloc<NotificationBlocEvent, NotificationBlocState> {
  final NotificationService notificationService;

  NotificationBlocBloc(this.notificationService)
      : super(NotificationInitial()) {
    on<FetchNotifications>(
      (event, emit) async {
        emit(NotificationLoading());
        try {
          final notificationModel =
              await notificationService.fetchNotifications();
          emit(
              NotificationLoaded(notificationModel as List<NotificationModel>));
        } catch (e) {
          emit(NotificationError('Failed to load notifications: $e'));
        }
      },
    );
  }
}
