import 'package:gelp_questionnaire/src/data/socioeconomic/repository/socioeconomic_impl.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/use_case/get_socioeconomic_questions_use_case.dart';

class QuestionPageBloc {
  final _getEconomicQuestionsUseCase = GetSocioeconomicQuestionsUseCase(
    SocioeconomicImpl(),
  );

  List<SocioeconomicQuestionModel> getEconomicQuestions() {
    return _getEconomicQuestionsUseCase();
  }
}
