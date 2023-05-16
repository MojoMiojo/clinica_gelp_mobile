
import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/use_case/get_socioeconomic_questions_use_case.dart';
import 'package:get_it/get_it.dart';

class QuestionPageBloc {
  final getIt = GetIt.I;
  final GetSocioeconomicQuestionsUseCase _getEconomicQuestionsUseCase;

  QuestionPageBloc(this._getEconomicQuestionsUseCase);

  List<SocioeconomicQuestionModel> getEconomicQuestions() {
    return _getEconomicQuestionsUseCase();
  }
}
