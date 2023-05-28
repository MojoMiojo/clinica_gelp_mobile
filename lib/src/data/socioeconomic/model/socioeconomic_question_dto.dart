import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';

extension SocioeconomicDTO on SocioeconomicQuestionModel {
  static SocioeconomicQuestionModel toDomain(Map<String, dynamic> json) {
    return SocioeconomicQuestionModel(
      id: json['id'],
      question: json['question'],
      answers: _parseAnswers(json['answers']),
    );
  }

  static List<Answer> _parseAnswers(List<dynamic> json) {
    return json.map((answer) {
      return Answer(
        id: answer['id'],
        answer: answer['answer'],
      );
    }).toList();
  }
}
