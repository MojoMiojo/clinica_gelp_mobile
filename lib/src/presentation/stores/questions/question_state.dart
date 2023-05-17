// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';

abstract class QuestionsState {}

class QuestionsInitialState implements QuestionsState {}

class QuestionsLoadedState implements QuestionsState {
  final SocioeconomicQuestionModel actualQuestion;
  final double progressPercentage;

  QuestionsLoadedState(
    this.actualQuestion,
    this.progressPercentage,
  );
}

class QuestionsLoadingState implements QuestionsState {}

class QuestionsErrorState implements QuestionsState {}
