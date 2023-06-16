import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_text_styles.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/image_app_bar/gelp_image_app_bar.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/text_field/gelp_text_field.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 16.0;
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: GelpImageAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 24),
            Text(
              'Antes de prosseguirmos, precisaremos de alguns dados pessoais:',
              style: GelpTextStyles.kPrimaryTitle,
              maxLines: 4,
            ),
            SizedBox(height: 28),
            Text(
              "Obs: Isto inclui aparalhos celulares, tablets, computadores, notebooks, video games, televisões, smart watches, etc.",
              style: GelpTextStyles.kPrimarySubtitle,
            ),
            SizedBox(height: 48),
            SingleChildScrollView(
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
            SizedBox(height: 48),
            Spacer(),
            GelpCustomButton(text: 'Confirmar'),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
