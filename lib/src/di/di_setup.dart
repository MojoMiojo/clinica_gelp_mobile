import 'package:gelp_questionnaire/src/data/socioeconomic/datasource/socioeconomic_datasource.dart';
import 'package:gelp_questionnaire/src/data/socioeconomic/repository/socioeconomic_impl.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/repository/socioeconomic_repository.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/use_case/get_socioeconomic_questions_use_case.dart';
import 'package:get_it/get_it.dart';

class DISetup {
  void inject() {
    final getIt = GetIt.I;

    _injectSocioeconomicRepository(getIt);
  }

  void _injectSocioeconomicRepository(GetIt getIt) {
    getIt.registerFactory<SocioeconomicDataSource>(
      () => SocioeconomicDataSource(),
    );
    getIt.registerFactory<SocioeconomicRepository>(
      () => SocioeconomicImpl(getIt()),
    );
    getIt.registerFactory<GetSocioeconomicQuestionsUseCase>(
      () => GetSocioeconomicQuestionsUseCase(getIt()),
    );
  }
}
