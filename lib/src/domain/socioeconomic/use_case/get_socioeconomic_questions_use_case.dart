// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/repository/socioeconomic_repository.dart';

class GetSocioeconomicQuestionsUseCase {
  final SocioeconomicRepository _socioeconomicRepository;

  GetSocioeconomicQuestionsUseCase(this._socioeconomicRepository);

  List<SocioeconomicQuestionModel> call() {
    return _socioeconomicRepository.getSocioeconomicQuestions();
  }
}
