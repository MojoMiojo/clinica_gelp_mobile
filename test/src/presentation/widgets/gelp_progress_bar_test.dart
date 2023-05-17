import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/widgets.dart';

import 'gelp_test_helper.dart';

const tParentSize = 300.0;
void main() {
  group("GelpProgressBar Build", () {
    final tGelpProgressBarFinder =
        find.byKey(const Key("gelp_animated_progress_bar"));
    testWidgets('Progress Bar deve ser executado sem parametros',
        (WidgetTester tester) async {
      // Build the widget.
      await tester.pumpWidget(
        widgetTestWrap(
          widget: const GelpProgressBar(),
        ),
      );

      expect(find.byType(GelpProgressBar), findsOneWidget);
    });
    testWidgets('Progress Bar width deve ser 0 quando a porcentagem for 0',
        (WidgetTester tester) async {
      // Build the widget.
      await tester.pumpGelpProgressBar(percentage: 0);

      final size = tester.getSize(tGelpProgressBarFinder);
      expect(size.width, 0);
    });
    testWidgets('Progress Bar width deve ser 0 quando a porcentagem for 0.1',
        (WidgetTester tester) async {
      // Build the widget.
      await tester.pumpGelpProgressBar(percentage: 0.1);

      final size = tester.getSize(tGelpProgressBarFinder);
      expect(size.width, 30);
    });
    testWidgets('Progress Bar width deve ser 150 quando a porcentagem for 0.5',
        (WidgetTester tester) async {
      // Build the widget.
      await tester.pumpGelpProgressBar(percentage: 0.5);

      final size = tester.getSize(tGelpProgressBarFinder);
      expect(size.width, 150);
    });
    testWidgets('Progress Bar width deve ser 300 quando a porcentagem for 1',
        (WidgetTester tester) async {
      // Build the widget.
      await tester.pumpGelpProgressBar(percentage: 1);

      final size = tester.getSize(tGelpProgressBarFinder);
      expect(size.width, tParentSize);
    });
  });

  group("GelpProgressBar Style", () {
    testWidgets('Progress Bar deve ser executado com valores padrões de estilo',
        (WidgetTester tester) async {
      // Build the widget.
      await tester.pumpGelpProgressBar(
        percentage: 0.5,
        style: const GelpProgressBarStyle(),
      );
      final Container bar =
          tester.firstWidget<Container>(find.byType(Container));
      final BoxDecoration barDecoration = bar.decoration as BoxDecoration;
      final AnimatedContainer animatedBar =
          tester.firstWidget<AnimatedContainer>(find.byType(AnimatedContainer));
      final BoxDecoration animatedBarDecoration =
          animatedBar.decoration as BoxDecoration;
      final Size size = tester.getSize(find.byType(Container).first);

      expect(barDecoration.color, Colors.grey);
      expect(barDecoration.borderRadius, BorderRadius.circular(8));
      expect(size.height, 10);
      expect(animatedBarDecoration.color, Colors.red);
    });

    testWidgets('Progress Bar deve ser executado com de estilo parametrizado',
        (WidgetTester tester) async {
      // Build the widget.
      await tester.pumpGelpProgressBar(
        percentage: 0.5,
        style: const GelpProgressBarStyle(
          backgroundColor: Colors.black,
          progressColor: Colors.green,
          height: 15,
          radius: 12,
        ),
      );
      final Container bar =
          tester.firstWidget<Container>(find.byType(Container));
      final BoxDecoration barDecoration = bar.decoration as BoxDecoration;
      final AnimatedContainer animatedBar =
          tester.firstWidget<AnimatedContainer>(find.byType(AnimatedContainer));
      final BoxDecoration animatedBarDecoration =
          animatedBar.decoration as BoxDecoration;
      final Size size = tester.getSize(find.byType(Container).first);

      expect(barDecoration.color, Colors.black);
      expect(barDecoration.borderRadius, BorderRadius.circular(12));
      expect(size.height, 15);
      expect(animatedBarDecoration.color, Colors.green);
    });
  });
}

extension _ProgressBarExtension on WidgetTester {
  Future<void> pumpGelpProgressBar(
      {required double percentage, GelpProgressBarStyle? style}) async {
    await pumpWidget(
      widgetTestWrap(
        widget: SizedBox(
          width: tParentSize,
          child: style != null
              ? GelpProgressBar(
                  percentage: percentage,
                  style: style,
                )
              : GelpProgressBar(percentage: percentage),
        ),
      ),
    );
  }
}
