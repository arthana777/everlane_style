
import 'package:everlane_style/bloc/change_password/bloc/change_password_event.dart';
import 'package:everlane_style/bloc/change_password/bloc/change_password_state.dart';
import 'package:everlane_style/data/datasources/change_password_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordRepo changePasswordRepo;

  ChangePasswordBloc({required this.changePasswordRepo})
      : super(ChangePasswordInitial()) {
    on<ChangePasswordSubmitted>(_onChangePasswordSubmitted);
  }

  Future<void> _onChangePasswordSubmitted(
      ChangePasswordSubmitted event, Emitter<ChangePasswordState> emit) async {
    emit(ChangePasswordLoading());

    try {
      final message = await changePasswordRepo.updatePassword({
        'old_password': event.oldPassword,
        'new_password': event.newPassword,
      });
      emit(ChangePasswordSucces(message: message));
    } catch (error) {
      emit(ChangePasswordFailure(error: error.toString()));
    }
  }
}
