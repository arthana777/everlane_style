import 'package:everlane_style/bloc/editprofile/bloc/editprofile_event.dart';
import 'package:everlane_style/bloc/editprofile/bloc/editprofile_state.dart';
import 'package:everlane_style/data/datasources/editprofileservice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditprofileBloc extends Bloc<EditprofileEvent, EditprofileState> {
  final Editprofileservice _editProfileService;

  EditprofileBloc(this._editProfileService) : super(UserProfileInitial()) {
    on<UpdateUserProfile>(_onUpdateUserProfile);
  }

  Future<void> _onUpdateUserProfile(
      UpdateUserProfile event,
       Emitter<EditprofileState> emit,
       ) async {
    emit(UserProfileLoading());
    try {
      await _editProfileService.updateUserProfile(event.updatedData);
      emit(UserProfileUpdated());
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }
}
