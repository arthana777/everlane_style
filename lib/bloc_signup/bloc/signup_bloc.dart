import 'package:everlane_style/bloc_signup/bloc/signup_state.dart';
import 'package:everlane_style/signup_page/signup_repo/signuprepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_event.dart';

class RegistrationBloc extends Bloc<SignupEvent, SignupState> {
  final SignupRepository signupRepository;

  RegistrationBloc(this.signupRepository) : super(RegistrationInitial()) {
    on<RegisterUser>((event, emit) async {
      emit(RegistrationLoading());
      try {
        final data = await signupRepository.registerUser(event.user);
        if (data == "success") {
          emit(RegistrationSuccess());
        } else {
          emit(RegistrationFailed(toString()));
        }
      } catch (e) {
        emit(RegistrationFailed(e.toString()));
      }
    });
  }
}
