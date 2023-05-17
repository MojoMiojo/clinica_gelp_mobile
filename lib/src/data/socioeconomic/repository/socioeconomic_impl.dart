import 'dart:convert';

import 'package:gelp_questionnaire/src/data/socioeconomic/datasource/socioeconomic_datasource.dart';
import 'package:gelp_questionnaire/src/data/socioeconomic/model/socioeconomic_question_dto.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/model/socioeconomic_question_model.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/repository/socioeconomic_repository.dart';

class SocioeconomicImpl implements SocioeconomicRepository {

  final SocioeconomicDataSource _socioEconomicDatasource;
  
  SocioeconomicImpl(this._socioEconomicDatasource);

  @override
  List<SocioeconomicQuestionModel> getSocioeconomicQuestions() {
    final String encodedJson = _socioEconomicDatasource.getSocioeconomicQuestions();
    final List decodedQuestions = json.decode(encodedJson);

    return decodedQuestions
        .map((question) => SocioeconomicDTO.toDomain(question))
        .toList();
  }
}
