import 'package:equatable/equatable.dart';

import '../../signup_page/user_reg_model/userregistration.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}
class RegisterUser extends SignupEvent {
  final Userregistration user;
  
  const RegisterUser(this.user);

  @override
  List<Object> get props => [user];
}
