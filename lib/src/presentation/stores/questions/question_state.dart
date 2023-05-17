import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';

abstract class QuestionsState {}

class QuestionsInitialState implements QuestionsState {}

class QuestionsLoadedState implements QuestionsState {
  final List<SocioeconomicQuestionModel> questions;

  QuestionsLoadedState(this.questions);
}

class QuestionsLoadingState implements QuestionsState {}

class QuestionsErrorState implements QuestionsState {}
