import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';

abstract class QuestionsState {}

class QuestionsInitialState implements QuestionsState {}

class QuestionsLoadedState implements QuestionsState {
  final SocioeconomicQuestionModel actualQuestion;
  final List<Answer> answers;
  final double progressPercentage;
  final Answer? answer;
  final String nextButtonText;
  final bool isFirstQuestion;

  QuestionsLoadedState(
    this.actualQuestion,
    this.answers,
    this.progressPercentage,
    this.answer,
    this.nextButtonText,
    this.isFirstQuestion,
  );
}

class QuestionsLoadingState implements QuestionsState {}

class QuestionsFinishedState implements QuestionsState {
  final double progressPercentage;

  QuestionsFinishedState(
    this.progressPercentage,
  );
}

class QuestionsErrorState implements QuestionsState {}
