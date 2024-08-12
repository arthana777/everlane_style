import 'package:equatable/equatable.dart';
import 'package:everlane_style/on_board/question%20model/question%20model.dart';

abstract class QuestionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuestionInitial extends QuestionState {}

class QuestionnaireLoading extends QuestionState {}

class QuestionnaireFetchSuccess extends QuestionState {
  final QuestionModel questionnaire;

  QuestionnaireFetchSuccess(this.questionnaire);

  @override
  List<Object?> get props => [questionnaire];
}

class QuestionnaireUpdateSuccess extends QuestionState {
  final QuestionModel updatedQuestionnaire;

  QuestionnaireUpdateSuccess(this.updatedQuestionnaire);

  @override
  List<Object?> get props => [updatedQuestionnaire];
}

class QuestionnaireFailed extends QuestionState {
  final String error;

  QuestionnaireFailed(this.error);

  @override
  List<Object?> get props => [error];
}
