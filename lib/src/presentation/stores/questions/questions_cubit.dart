import 'package:gelp_questionnaire/src/domain/excel_socioeconomic/use_case/create_excel_file_use_case.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/use_case/get_socioeconomic_questions_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelp_questionnaire/src/presentation/stores/questions/question_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  final GetSocioeconomicQuestionsUseCase _getEconomicQuestionsUseCase;
  final CreateExcelFileUseCase _createExcelFileUseCase;

  late List<SocioeconomicQuestionModel> _listOfQuestions;
  late Map<int, Answer> _userAnswers;
  late Map<String, String> _userAnswersToExcel;
  late double _progressPercentage;
  late int _listLength;

  int _questionIndex = 0;

  QuestionsCubit(
    this._getEconomicQuestionsUseCase,
    this._createExcelFileUseCase,
  ) : super(QuestionsInitialState());

  void init() {
    _progressPercentage = 0;
    _listOfQuestions = _getEconomicQuestions();
    _listLength = _listOfQuestions.length;
    _userAnswers = {};
    _userAnswersToExcel = {};

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
        _questionIndex == _listLength - 1 ? 'Finalizar' : 'Próximo',
        _questionIndex == 0,
      ));
    } else {
      createExcel();
      emit(QuestionsFinishedState(_progressPercentage));
    }
  }

  void createExcel() {
    _createExcelFileUseCase(fileName: 'Mojo', answersMap: _userAnswersToExcel);
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
    _userAnswersToExcel[_listOfQuestions[_questionIndex].question] =
        answer.answer;
    _emitQuestion();
  }

  bool isAnswerSelected(Answer answer) {
    return answer == _userAnswers[_questionIndex];
  }

  bool isNextButtonEnabled() {
    return _userAnswers[_questionIndex] != null;
  }
}
