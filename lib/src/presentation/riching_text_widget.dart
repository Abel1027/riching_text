import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:riching_text/src/domain/actionable_text.dart';
import 'package:riching_text/src/utils/utils.dart';

/// {@template riching_text}
/// Build a rich text by providing the whole string [text]
/// and a list of words/phrases that you want to highlight and/or
/// make actionables [highlights] within the [text].
/// {@endtemplate}
class RichingText extends StatefulWidget {
  /// {@macro riching_text}
  const RichingText({
    super.key,
    this.richTextKey,
    this.highlights = const <ActionableText>[],
    required this.text,
    this.style,
    this.textAlign = TextAlign.start,
    this.noOverrideGesture = false,
  }) : super();

  /// Rich text key.
  final Key? richTextKey;

  /// Highlighted text list.
  final List<ActionableText> highlights;

  /// Text.
  final String text;

  /// Text style.
  final TextStyle? style;

  /// Text alignment.
  final TextAlign textAlign;

  /// No override gesture.
  final bool noOverrideGesture;

  @override
  State<RichingText> createState() => _RichingTextState();
}

class _RichingTextState extends State<RichingText> {
  late final List<String> _splittedText;

  @override
  void initState() {
    _splittedText = splitAndMatch(
      phrase: widget.text,
      matches: widget.highlights.map((e) => e.text).toList(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      key: widget.richTextKey,
      text: TextSpan(
        children: _splittedText.map(
          (match) {
            final highlight = widget.highlights.firstWhereOrNull(
              (element) => element.text == match,
            );

            return TextSpan(
              text: match,
              style: highlight?.style ?? widget.style,
              recognizer: widget.noOverrideGesture
                  ? null
                  : (TapGestureRecognizer()
                    ..onTap = () => highlight?.action?.call()),
            );
          },
        ).toList(),
      ),
      textAlign: widget.textAlign,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
    );
  }
}
