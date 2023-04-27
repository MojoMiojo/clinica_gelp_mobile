import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/presentation/Utils/text_styles.dart';
import 'package:gelp_questionnaire/presentation/widgets/image_app_bar.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ImageAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Quantos aparelhos com acesso a internet você possui em sua residência?",
              style: primaryText.style(),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
