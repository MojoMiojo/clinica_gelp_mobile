import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';

abstract class SocioeconomicRepository {
  List<SocioeconomicQuestionModel> getSocioeconomicQuestions();
}
