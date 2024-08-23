import 'package:everlane_style/bloc/change_password/bloc/change_password_event.dart';
import 'package:everlane_style/bloc/change_password/bloc/change_password_state.dart';
import 'package:everlane_style/data/datasources/change_password_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordRepo changePasswordRepo;

  ChangePasswordBloc({required this.changePasswordRepo}) : super(ChangePasswordInitial());

  @override
  Stream<ChangePasswordState> mapEventToState(ChangePasswordEvent event) async* {
    if (event is ChangePasswordSubmitted) {
      yield ChangePasswordLoading();

      try {
        final message = await changePasswordRepo.updatePassword({
          'old_password': event.oldPassword,
          'new_password': event.newPassword,
        });

        yield ChangePasswordSucces(message: message);
      } catch (error) {
        yield ChangePasswordFailure(error: error.toString());
      }
    }
  }
}
