/// Split string and match one occurrence.
List<String> _splitAndMatchOneTime({
  required List<String> oStringList,
  required String match,
  required List<String> matches,
}) {
  final splittedStringWordAppendedList = <String>[];

  for (final oString in oStringList) {
    final splittedStringList =
        matches.contains(oString) ? [oString] : oString.split(match);

    for (var i = 0; i < splittedStringList.length; i++) {
      splittedStringWordAppendedList.add(splittedStringList.elementAt(i));
      if (i == splittedStringList.length - 1) continue;

      splittedStringWordAppendedList.add(match);
    }

    splittedStringWordAppendedList.removeWhere((e) => e.isEmpty);
  }

  return splittedStringWordAppendedList;
}

/// Split string and match all occurrences.
List<String> splitAndMatch({
  required String phrase,
  required List<String> matches,
}) {
  matches.sort((a, b) => b.length.compareTo(a.length));

  var stringList = <String>[phrase];

  for (final match in matches) {
    stringList = _splitAndMatchOneTime(
      oStringList: stringList,
      match: match,
      matches: matches,
    );
  }
  return stringList;
}

/// Iterable extension.
extension IterableExtension<T> on Iterable<T> {
  /// Get first element that satisfies the condition or returns null.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }

    return null;
  }
}
