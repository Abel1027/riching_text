import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riching_text/riching_text.dart';

void main() {
  test('copyWith', () {
    const object = ActionableText(text: 'text');

    expect(
      object.copyWith(),
      const ActionableText(text: 'text'),
    );
    expect(
      object.copyWith(
        style: const TextStyle(color: Colors.red),
        action: () {},
      ),
      ActionableText(
        text: 'text',
        style: const TextStyle(color: Colors.red),
        action: () {},
      ),
    );
  });

  test('toString', () {
    final object = ActionableText(
      text: 'text',
      style: const TextStyle(color: Colors.red),
      action: () {},
    );

    expect(
      object.toString(),
      'ActionableText(text: text, style: TextStyle(inherit: true, '
      'color: MaterialColor(primary value: Color(0xfff44336))), '
      'action: Closure: () => void)',
    );
  });

  test('hashCode', () {
    final objectOne = ActionableText(
      text: 'text',
      style: const TextStyle(color: Colors.red),
      action: () {},
    );

    final objectTwo = ActionableText(
      text: 'text',
      style: const TextStyle(color: Colors.red),
      action: () {},
    );

    expect(
      identical(objectOne.hashCode, objectTwo.hashCode),
      true,
    );
  });
}
