import 'package:bloc/bloc.dart';
import 'package:everlane_style/bloc/question_bloc/bloc/question_event.dart';
import 'package:everlane_style/bloc/question_bloc/bloc/question_state.dart';
import 'package:everlane_style/on_board/questionnaire_service/qst_service.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final QstService qstService;

  QuestionBloc(this.qstService) : super(QuestionInitial()) {  
    on<FetchQuestionnaire>((event, emit) async {
      emit(QuestionnaireLoading());
      try {
        final questionnaire = await qstService.fetchQuestionnaire();
        emit(QuestionnaireFetchSuccess(questionnaire));
      } catch (e) {
        emit(QuestionnaireFailed('Failed to fetch questionnaire: ${e.toString()}'));
      }
    });

    on<UpdateQuestionnaire>((event, emit) async {
      emit(QuestionnaireLoading());
      try {
        final updatedQuestionnaire = await qstService.updateQuestionnaire(event.data);
        emit(QuestionnaireUpdateSuccess(updatedQuestionnaire));
      } catch (e) {
        emit(QuestionnaireFailed('Failed to update questionnaire: ${e.toString()}'));
      }
    });
  }
}
