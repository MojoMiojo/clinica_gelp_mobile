import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/presentation/Utils/text_styles.dart';
import 'package:gelp_questionnaire/presentation/widgets/image_app_bar_widget.dart';
import 'package:gelp_questionnaire/presentation/widgets/progress_bar_widget.dart';
import 'package:gelp_questionnaire/presentation/widgets/radius_field_widget.dart';

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Flexible(
                child: ProgressBar(),
              ),
              const SizedBox(height: 24),
              Text(
                "Quantos aparelhos com acesso a internet você possui em sua residência?",
                style: primaryTitle.style(),
                maxLines: 3,
              ),
              const SizedBox(height: 30),
              Text(
                "Obs: Isto inclui aparalhos celulares, tablets, computadores, notebooks, video games, televisões, smart watches, etc.",
                style: primarySubtitle.style(),
              ),
              const SizedBox(height: 30),
              const RadiusField(text: '1 - Um'),
              const SizedBox(height: 16),
              const RadiusField(text: '2 - Dois'),
              const SizedBox(height: 16),
              const RadiusField(text: '3 - Três'),
              const SizedBox(height: 16),
              const RadiusField(text: '4 - Quatro'),
              const SizedBox(height: 16),
              const RadiusField(text: '5+ - Cinco ou Mais'),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text('Botão'),
                  Text('Botão'),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
