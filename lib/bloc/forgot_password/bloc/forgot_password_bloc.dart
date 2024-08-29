import 'package:everlane_style/bloc/forgot_password/bloc/forgot_password_event.dart';
import 'package:everlane_style/bloc/forgot_password/bloc/forgot_password_state.dart';
import 'package:everlane_style/data/datasources/forgot_password_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordService authRepository;

  ForgotPasswordBloc({required this.authRepository})
      : super(ForgotPasswordInitial()) {
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
  }

  Future<void> _onForgotPasswordRequested(
    ForgotPasswordRequested event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    print("ForgotPasswordRequested event verununde");
    emit(ForgotPasswordLoading());
    try {
      print("success vernd");
      await authRepository.forgotPassword(event.username);
      emit(ForgotPasswordSuccess());
    } catch (e) {
      print('poyii guuyd');
      emit(ForgotPasswordFailure(error: e.toString()));
    }
  }
}
