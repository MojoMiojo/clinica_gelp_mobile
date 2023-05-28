// ignore_for_file: public_member_api_docs, sort_constructors_first
class SocioeconomicQuestionModel {
  int id;
  String question;
  List<Answer> answers;

  SocioeconomicQuestionModel({
    required this.id,
    required this.question,
    required this.answers,
  });
}

class Answer {
  int id;
  String answer;

  Answer({
    required this.id,
    required this.answer,
  });
}
