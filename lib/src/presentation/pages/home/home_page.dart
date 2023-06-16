import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/src/presentation/pages/questions/question_page.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_text_styles.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/image_app_bar/gelp_image_app_bar.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/text_field/gelp_text_field.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 16.0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GelpImageAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Text(
              'Antes de prosseguirmos, precisaremos de alguns dados pessoais:',
              style: GelpTextStyles.kPrimaryTitle,
              maxLines: 4,
            ),
            const SizedBox(height: 28),
            const Text(
              "Obs: Isto inclui aparalhos celulares, tablets, computadores, notebooks, video games, televisões, smart watches, etc.",
              style: GelpTextStyles.kPrimarySubtitle,
            ),
            const SizedBox(height: 48),
            const SingleChildScrollView(
              child: Column(
                children: [
                  GelpTextField(
                    fieldName: 'Nome completo',
                    hintText: 'Jeferson Antônio do Sa',
                  ),
                  SizedBox(height: 16),
                  GelpTextField(
                    fieldName: 'Celular',
                    hintText: '(xx) xxxxx-xxxx',
                  ),
                  SizedBox(height: 16),
                  GelpTextField(
                    fieldName: 'CPF',
                    hintText: 'xxx.xxx.xxx-xx',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            const Spacer(),
            GelpCustomButton(
              text: 'Confirmar',
              onTap: () => _onConfirm(context),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _onConfirm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const QuestionPage();
        },
      ),
    );
  }

}
