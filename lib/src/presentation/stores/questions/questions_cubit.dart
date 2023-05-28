import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/use_case/get_socioeconomic_questions_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelp_questionnaire/src/presentation/stores/questions/question_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  late double _progressPercentage;
  late List<SocioeconomicQuestionModel> _listOfQuestions;
  late int _listLength;
  final GetSocioeconomicQuestionsUseCase _getEconomicQuestionsUseCase;

  int _questionIndex = 0;

  QuestionsCubit(
    this._getEconomicQuestionsUseCase,
  ) : super(QuestionsInitialState());

  void init() {
    _progressPercentage = 0;
    _listOfQuestions = _getEconomicQuestions();
    _listLength = _listOfQuestions.length;

    Future.delayed(const Duration(seconds: 2), () {
      _emitQuestion();
    });
  }

  List<SocioeconomicQuestionModel> _getEconomicQuestions() {
    return _getEconomicQuestionsUseCase();
  }

  void _emitQuestion() {
    if (_questionIndex < _listLength) {
      emit(QuestionsLoadedState(
        _listOfQuestions[_questionIndex],
        _progressPercentage,
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
}
