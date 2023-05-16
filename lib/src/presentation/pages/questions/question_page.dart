import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/src/presentation/Utils/text_styles.dart';
import 'package:gelp_questionnaire/src/presentation/pages/questions/questions_page_bloc.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/custom_button_widget.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/image_app_bar_widget.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/progress_bar_widget.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/radius_field_widget.dart';
import 'package:get_it/get_it.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final questionPageBloc = QuestionPageBloc(GetIt.I());
  final questionList = ['1 - Um', '2 - Dois', '3 - Três', '4 - Quatro ou Mais'];

  @override
  Widget build(BuildContext context) {
    final questions = questionPageBloc.getEconomicQuestions();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ImageAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProgressBar(),
            const SizedBox(height: 24),
            Text(
              questions.first.question,
              style: primaryTitle.style(),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            Text(
              "Obs: Isto inclui aparalhos celulares, tablets, computadores, notebooks, video games, televisões, smart watches, etc.",
              style: primarySubtitle.style(),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: questionList
                        .map(
                          (question) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: RadiusField(text: question),
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
                  child: CustomButton(
                    text: 'Voltar',
                    buttonColor: Colors.white,
                    borderColor: Colors.red,
                    borderWidth: 2,
                    textStyle: primaryButton.customColored(Colors.black),
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: CustomButton(
                    text: 'Próximo',
                    buttonColor: Colors.red,
                    textStyle: primaryButton.style(),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
