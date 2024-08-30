import 'package:everlane_style/bloc/notifications/bloc/notification_bloc_bloc.dart';
import 'package:everlane_style/bloc/notifications/bloc/notification_bloc_event.dart';
import 'package:everlane_style/bloc/notifications/bloc/notification_bloc_state.dart';
import 'package:everlane_style/data/datasources/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: BlocProvider(
        create: (context) => NotificationBlocBloc(NotificationService())
          ..add(FetchNotifications()),
        child: BlocBuilder<NotificationBlocBloc, NotificationBlocState>(
          builder: (context, state) {
            if (state is NotificationLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is NotificationLoaded) {
              return ListView.builder(
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  final notification = state.notifications[index];
                  return ListTile(
                    title: Text(notification.verb ?? 'No title'),
                    subtitle:
                        Text(notification.description ?? 'No description'),
                    trailing: Text(
                      notification.timestamp?.toLocal().toString() ??
                          'No timestamp',
                      style: TextStyle(fontSize: 12),
                    ),
                  );
                },
              );
            } else if (state is NotificationError) {
              return Center(
                  child:
                      Text('Error: ${state.message}')); // Displaying the error
            } else {
              return Center(child: Text('No notifications available'));
            }
          },
        ),
      ),
    );
  }
}
