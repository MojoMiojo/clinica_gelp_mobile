import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/use_case/get_socioeconomic_questions_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelp_questionnaire/src/presentation/stores/questions/question_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  late double _progressPercentage;
  late List<SocioeconomicQuestionModel> _listOfQuestions;
  final GetSocioeconomicQuestionsUseCase _getEconomicQuestionsUseCase;

  int _questionIndex = 0;

  QuestionsCubit(
    this._getEconomicQuestionsUseCase,
  ) : super(QuestionsInitialState());

  void init() {
    _progressPercentage = 0;
    _listOfQuestions = _getEconomicQuestions();

    Future.delayed(const Duration(seconds: 2), () {
      _emitQuestion();
    });
  }

  List<SocioeconomicQuestionModel> _getEconomicQuestions() {
    return _getEconomicQuestionsUseCase();
  }

  void _emitQuestion() {
    emit(QuestionsLoadedState(
      _listOfQuestions[_questionIndex],
      _progressPercentage,
    ));
  }

  void goToNextQuestion() {
    final listLength = _listOfQuestions.length;

    if (_questionIndex < listLength) {
      _questionIndex++;
      _progressPercentage = _questionIndex / listLength;

      _emitQuestion();
    }
  }

  void goToPreviousQuestion() {
    final listLength = _listOfQuestions.length;

    if (_questionIndex > 0) {
      _questionIndex--;
      _progressPercentage = _questionIndex / listLength;
      _emitQuestion();
    }
  }
}
