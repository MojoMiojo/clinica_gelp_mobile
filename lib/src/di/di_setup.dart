import 'package:gelp_questionnaire/src/data/socioeconomic/datasource/socioeconomic_datasource.dart';
import 'package:gelp_questionnaire/src/data/socioeconomic/repository/socioeconomic_impl.dart';
import 'package:gelp_questionnaire/src/domain/excel_socioeconomic/use_case/create_excel_file_use_case.dart';
import 'package:gelp_questionnaire/src/domain/excel_socioeconomic/use_case/save_excel_file_use_case.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/repository/socioeconomic_repository.dart';
import 'package:gelp_questionnaire/src/domain/socioeconomic/use_case/get_socioeconomic_questions_use_case.dart';
import 'package:gelp_questionnaire/src/presentation/stores/questions/questions_cubit.dart';
import 'package:get_it/get_it.dart';

class DISetup {
  void inject() {
    final getIt = GetIt.I;
    _injectSocioeconomicRepository(getIt);
    _injectCubits(getIt);
    _injectUseCases(getIt);
  }

  // Cubits
  void _injectCubits(GetIt getIt) {
    getIt.registerFactory<QuestionsCubit>(
        () => QuestionsCubit(getIt(), getIt()));
  }

  // Repository
  void _injectSocioeconomicRepository(GetIt getIt) {
    getIt.registerFactory<SocioeconomicDataSource>(
      () => SocioeconomicDataSource(),
    );
    getIt.registerFactory<SocioeconomicRepository>(
      () => SocioeconomicImpl(getIt()),
    );
  }

  // UseCase
  void _injectUseCases(GetIt getIt) {
    getIt.registerFactory<GetSocioeconomicQuestionsUseCase>(
      () => GetSocioeconomicQuestionsUseCase(getIt()),
    );
    
    getIt.registerFactory<CreateExcelFileUseCase>(
      () => CreateExcelFileUseCase(getIt()),
    );

    getIt.registerFactory<SaveExcelUseCase>(
      () => SaveExcelUseCase(),
    );
  }

}
