import 'package:flutter_test/flutter_test.dart';
import 'package:riching_text/src/utils/utils.dart';

void main() {
  const text =
      'This is an example text for testing the split and match on text';

  group('splitAndMatch', () {
    test('should not split string', () {
      final matches = <String>[];
      final result = splitAndMatch(phrase: text, matches: matches);
      expect(result, [text]);
    });

    test('should split string in two parts', () {
      final matches = ['This'];
      final result = splitAndMatch(phrase: text, matches: matches);
      expect(
        result,
        ['This', ' is an example text for testing the split and match on text'],
      );
    });

    test('should split string in three parts', () {
      final matches = [' an example '];
      final result = splitAndMatch(phrase: text, matches: matches);
      expect(
        result,
        [
          'This is',
          ' an example ',
          'text for testing the split and match on text',
        ],
      );
    });

    test('should split string in four parts', () {
      final matches = ['text'];
      final result = splitAndMatch(phrase: text, matches: matches);
      expect(
        result,
        [
          'This is an example ',
          'text',
          ' for testing the split and match on ',
          'text',
        ],
      );
    });

    test('should split text by spaces', () {
      final matches = [' '];
      final result = splitAndMatch(phrase: text, matches: matches);
      expect(
        result,
        [
          'This',
          ' ',
          'is',
          ' ',
          'an',
          ' ',
          'example',
          ' ',
          'text',
          ' ',
          'for',
          ' ',
          'testing',
          ' ',
          'the',
          ' ',
          'split',
          ' ',
          'and',
          ' ',
          'match',
          ' ',
          'on',
          ' ',
          'text',
        ],
      );
    });

    test('should split string accordingly using two consecutive matches', () {
      final matches = ['text', ' for'];
      final result = splitAndMatch(phrase: text, matches: matches);
      expect(
        result,
        [
          'This is an example ',
          'text',
          ' for',
          ' testing the split and match on ',
          'text',
        ],
      );
    });
  });

  group('IterableExtension', () {
    group('firstWhereOrNull', () {
      test('should return null when iterable is empty', () {
        const iter = Iterable.empty();
        expect(iter.firstWhereOrNull((element) => true), null);
      });

      test('should return null when condition is not satisfied', () {
        final iter = Iterable.generate(2, (_) => false);
        expect(iter.firstWhereOrNull((element) => element), null);
      });

      test('should return 1 when condition is satisfied', () {
        final iter = Iterable.generate(2, (index) => index);
        expect(iter.firstWhereOrNull((element) => element == 1), 1);
      });
    });
  });
}
