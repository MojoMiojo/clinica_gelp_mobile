import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final questionList = [
    '1 - Um',
    '2 - Dois',
    '3 - Três',
    '4 - Quatro',
    '+5 - Cinco ou Mais',
  ];

  @override
  Widget build(BuildContext context) {
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
              "Quantos aparelhos com acesso a internet você possui em sua residência?",
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
