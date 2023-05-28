import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/use_case/get_socioeconomic_questions_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelp_questionnaire/src/presentation/stores/questions/question_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  final GetSocioeconomicQuestionsUseCase _getEconomicQuestionsUseCase;

  late List<SocioeconomicQuestionModel> _listOfQuestions;
  late Map<int, Answer> _userAnswers;
  late double _progressPercentage;
  late int _listLength;

  int _questionIndex = 0;

  QuestionsCubit(
    this._getEconomicQuestionsUseCase,
  ) : super(QuestionsInitialState());

  void init() {
    _progressPercentage = 0;
    _listOfQuestions = _getEconomicQuestions();
    _listLength = _listOfQuestions.length;
    _userAnswers = {};

    Future.delayed(const Duration(seconds: 2), () {
      _emitQuestion();
    });
  }

  List<SocioeconomicQuestionModel> _getEconomicQuestions() {
    return _getEconomicQuestionsUseCase();
  }

  void _emitQuestion() {
    if (_questionIndex < _listLength) {
      final question = _listOfQuestions[_questionIndex];
      emit(QuestionsLoadedState(
        question,
        question.answers,
        _progressPercentage,
        _userAnswers[_questionIndex],
      ));
    } else {
      emit(QuestionsFinishedState(_progressPercentage));
    }
  }

  void goToNextQuestion() {
    final listLength = _listLength;

    if (_questionIndex <= listLength) {
      _questionIndex++;
      _progressPercentage = _questionIndex / listLength;

      _emitQuestion();
    }
  }

  void goToPreviousQuestion() {
    final listLength = _listLength;

    if (_questionIndex > 0) {
      _questionIndex--;
      _progressPercentage = _questionIndex / listLength;

      _emitQuestion();
    }
  }

  void setAnswer(Answer answer) {
    _userAnswers[_questionIndex] = answer;
    _emitQuestion();
  }

  bool isAnswerSelected(Answer answer) {
    return answer == _userAnswers[_questionIndex];
  }

  bool isNextButtonEnabled() {
    return _userAnswers[_questionIndex] != null;
  }
}
