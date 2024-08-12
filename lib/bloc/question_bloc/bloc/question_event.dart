import 'package:equatable/equatable.dart';
import 'package:everlane_style/on_board/question%20model/question%20model.dart';

abstract class QuestionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchQuestionnaire extends QuestionEvent {}

class UpdateQuestionnaire extends QuestionEvent {
  final Data data;

  UpdateQuestionnaire({required this.data});

  @override
  List<Object?> get props => [data];
}
