import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:riching_text/riching_text.dart';

void main() {
  testWidgets('RichingText', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: RichingText(
              key: const Key('rich_text_key'),
              highlights: [
                ActionableText(
                  text: 'styled text',
                  style: const TextStyle(color: Colors.red),
                  action: () {},
                ),
              ],
              text: 'This is an example of a string '
                  'with a styled text that can be actionable',
            ),
          ),
        ),
      ),
    );

    await tester.pump();

    final finder = find.byWidgetPredicate(
      (widget) => widget is RichText && _tapTextSpan(widget, 'styled text'),
    );
    expect(finder, findsOneWidget);
  });
}

bool _tapTextSpan(RichText richText, String text) {
  final isTapped = !richText.text.visitChildren(
    (visitor) => _findTextAndTap(visitor, text),
  );

  return isTapped;
}

bool _findTextAndTap(InlineSpan visitor, String text) {
  if (visitor is TextSpan && visitor.text == text) {
    (visitor.recognizer as TapGestureRecognizer).onTap?.call();

    return false;
  }

  return true;
}
