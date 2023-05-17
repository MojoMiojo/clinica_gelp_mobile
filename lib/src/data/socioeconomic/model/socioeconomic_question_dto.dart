import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';

extension SocioeconomicDTO on SocioeconomicQuestionModel {
  
  static SocioeconomicQuestionModel toDomain(Map<String, dynamic> json) {
    return SocioeconomicQuestionModel(
      id: json['id'],
      question: json['question'],
    );
  }
}
