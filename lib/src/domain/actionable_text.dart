import 'package:flutter/material.dart';

/// {@template actionable_text}
/// Actionable text and related style.
/// {@endtemplate}
class ActionableText {
  /// {@macro actionable_text}
  const ActionableText({
    required this.text,
    this.style,
    this.action,
  });

  /// Text string.
  final String text;

  /// Text style.
  final TextStyle? style;

  /// Text pressed callback.
  final VoidCallback? action;

  ActionableText copyWith({
    String? text,
    TextStyle? style,
    VoidCallback? action,
  }) {
    return ActionableText(
      text: text ?? this.text,
      style: style ?? this.style,
      action: action ?? this.action,
    );
  }

  @override
  String toString() =>
      'ActionableText(text: $text, style: $style, action: $action)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ActionableText &&
        other.text == text &&
        other.style == style;
  }

  @override
  int get hashCode => text.hashCode ^ style.hashCode;
}
