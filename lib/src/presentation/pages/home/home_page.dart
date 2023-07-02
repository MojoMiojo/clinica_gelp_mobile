import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/src/presentation/pages/questions/question_page.dart';
import 'package:gelp_questionnaire/src/presentation/stores/home/home_cubit.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_text_styles.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/text_field/gelp_text_field.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeCubit();

  late String nameText;
  final _nameFieldKey = GlobalKey<FormState>();

  late String phoneText;
  final _phoneFieldKey = GlobalKey<FormState>();

  late String cpfText;
  final _cpfFieldKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            SingleChildScrollView(
              child: Column(
                children: [
                  GelpTextField(
                    formKey: _nameFieldKey,
                    fieldName: 'Nome completo',
                    hintText: 'Jeferson Antônio do Sa',
                    onChanged: (p0) {
                      nameText = p0;
                    },
                    validator: homeController.nameValidator,
                  ),
                  const SizedBox(height: 16),
                  GelpTextField(
                    formKey: _phoneFieldKey,
                    fieldName: 'Celular',
                    hintText: '(xx) xxxxx-xxxx',
                    onChanged: (p0) {
                      phoneText = p0;
                    },
                    validator: homeController.phoneValidator,
                  ),
                  const SizedBox(height: 16),
                  GelpTextField(
                    formKey: _cpfFieldKey,
                    fieldName: 'CPF',
                    hintText: 'xxx.xxx.xxx-xx',
                    onChanged: (p0) {
                      cpfText = p0;
                    },
                    validator: homeController.cpfValidator,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            const Spacer(),
            GelpCustomButton(
              text: 'Confirmar',
              onTap: () {
                final isNameValid = _nameFieldKey.currentState!.validate();
                final isPhoneValid = _phoneFieldKey.currentState!.validate();
                final isCpfValid = _cpfFieldKey.currentState!.validate();
                if (isNameValid && isPhoneValid && isCpfValid) {
                  _onConfirm(context);
                  
                }
              },
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
