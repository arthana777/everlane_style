import 'package:everlane_style/bloc/question_bloc/bloc/question_event.dart';
import 'package:everlane_style/bloc/question_bloc/bloc/question_state.dart';
import 'package:everlane_style/data/datasources/qst_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final QstService _qstService;

  QuestionBloc(this._qstService) : super(QstInitial()) {
    on<UpdateQuestion>(_onUpdateQuestion);
  }

  Future<void> _onUpdateQuestion(
      UpdateQuestion event,
       Emitter<QuestionState> emit,
       ) async {
    emit(QuestionLoading());
    try {
      await _qstService.updateQuestion(event.updatedQst);
      emit(QuestionUpdated());
    } catch (e) {
      emit(QuestionError(e.toString()));
    }
  }
}
