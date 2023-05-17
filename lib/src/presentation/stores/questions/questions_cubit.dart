import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/use_case/get_socioeconomic_questions_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelp_questionnaire/src/presentation/stores/questions/question_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  final getIt = GetIt.I;
  final GetSocioeconomicQuestionsUseCase _getEconomicQuestionsUseCase;
  late List<SocioeconomicQuestionModel> _listOfQuestions;
  late double _progressPercentage;
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

  void goToNextQuestion() {
    if (_questionIndex <= _listOfQuestions.length) {
      _questionIndex++;
    }
  }

  void _emitQuestion() {
    emit(QuestionsLoadedState(
      _listOfQuestions[_questionIndex],
      _progressPercentage,
    ));
  }
}
