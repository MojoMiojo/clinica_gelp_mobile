import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/src/presentation/pages/questions/question_page.dart';
import 'package:gelp_questionnaire/src/presentation/pages/web_view_page.dart';
import 'package:gelp_questionnaire/src/presentation/stores/home/home_cubit.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_colors.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_text_styles.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/check_box_widget.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/text_field/gelp_text_field.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

  bool isCheckBoxConfirmed = false;
  bool mustCheckUseTerm = false;
  
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
            CheckBoxWidget(
                isConfirmed: isCheckBoxConfirmed,
                text: Text(
                  'Concordo que li e aceitei os termos de uso.',
                  style: mustCheckUseTerm
                      ? GelpTextStyles.kUseTermText
                          .copyWith(color: GelpColors.primary)
                      : GelpTextStyles.kUseTermText,
                ),
                onTap: (_) {
                  if (isCheckBoxConfirmed) {
                    setState(() {
                      isCheckBoxConfirmed = !isCheckBoxConfirmed;
                    });
                  } else {
                    _navigateTo(
                        context,
                        WebViewPage(
                          onAccept: (value) {
                            setState(() {
                              isCheckBoxConfirmed = value;
                              mustCheckUseTerm = false;
                            });
                          },
                          onError: (WebResourceError e) {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                elevation: 0.8,
                                showCloseIcon: true,
                                duration: const Duration(seconds: 5),
                                closeIconColor: GelpColors.primary,
                                content: Text('Ops! ${e.description} '),
                              ),
                            );
                          },
                        ));
                  }
                }),
            const SizedBox(height: 24),
            GelpCustomButton(
              text: 'Confirmar',
              onTap: () {
                final isNameValid = _nameFieldKey.currentState!.validate();
                final isPhoneValid = _phoneFieldKey.currentState!.validate();
                final isCpfValid = _cpfFieldKey.currentState!.validate();
                if (isNameValid && isPhoneValid && isCpfValid) {
                  _navigateTo(context, const QuestionPage());
                } else {
                  setState(() {
                    mustCheckUseTerm = true;
                  });
                }
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }
}
