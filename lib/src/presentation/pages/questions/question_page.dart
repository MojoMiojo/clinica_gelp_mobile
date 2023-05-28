import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_colors.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_images.dart';
import 'package:gelp_questionnaire/src/presentation/stores/questions/question_state.dart';
import 'package:gelp_questionnaire/src/presentation/stores/questions/questions_cubit.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_text_styles.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/widgets.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late final QuestionsCubit _questionCubit;

  @override
  void initState() {
    _questionCubit = GetIt.I();
    _questionCubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GelpImageAppBar(),
      body: BlocBuilder<QuestionsCubit, QuestionsState>(
        bloc: _questionCubit,
        builder: (context, state) {
          if (state is QuestionsLoadedState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GelpProgressBar(
                    percentage: state.progressPercentage,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    state.actualQuestion.question,
                    style: GelpTextStyles.kPrimaryTitle,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Obs: Isto inclui aparalhos celulares, tablets, computadores, notebooks, video games, televisões, smart watches, etc.",
                    style: GelpTextStyles.kPrimarySubtitle,
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: state.answers
                              .map(
                                (answer) => Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: GelpRadiusField(
                                    text: answer.answer,
                                    isSelected:
                                        _questionCubit.isAnswerSelected(answer),
                                    index: answer.id,
                                    callback: (id) {
                                      _questionCubit.setAnswer(answer);
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: GelpCustomButton(
                          text: 'Voltar',
                          style: const GelpCustomButtonStyle.secondary(),
                          onTap: () {
                            _questionCubit.goToPreviousQuestion();
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: GelpCustomButton(
                          text: 'Próximo',
                          style: _questionCubit.isNextButtonEnabled()
                              ? const GelpCustomButtonStyle.primary()
                              : const GelpCustomButtonStyle.disabled(),
                          onTap: _questionCubit.isNextButtonEnabled()
                              ? () {
                                  _questionCubit.goToNextQuestion();
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            );
          } else if (state is QuestionsFinishedState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GelpProgressBar(
                    percentage: state.progressPercentage,
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    GelpConstants.successFinishedSVG,
                    height: 72,
                    width: 72,
                    colorFilter: const ColorFilter.mode(
                      GelpColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Questionário finalizado",
                    style: GelpTextStyles.kPrimaryTitle,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Obrigado pela participação!",
                    style: GelpTextStyles.kPrimarySubtitle,
                  ),
                  const Spacer(),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }
}
