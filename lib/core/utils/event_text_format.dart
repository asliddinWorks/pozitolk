
String extractTextBetweenEscapedTags(String input, String tag) {
  final pattern = RegExp('&lt;$tag&gt;(.*?)&lt;/$tag&gt;', dotAll: true);
  final match = pattern.firstMatch(input);
  return match != null ? match.group(1)! : '';
}

String extractFirstLiText(String input) {
  final pattern = RegExp(r'/p&gt;&lt;ul&gt;&lt;li&gt;(.*?)&lt;', dotAll: true);
  final match = pattern.firstMatch(input);
  if (match != null) {
    var text = match.group(1)!;

    // HTML escape belgilarini oddiy belgiga o‘zgartiramiz
    text = text
        .replaceAll('&laquo;', '«')
        .replaceAll('&raquo;', '»')
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&apos;', "'");

    return text;
  }
  return '';
}

List<String> extractLiTexts(String input) {
  final pattern = RegExp(r'&lt;li&gt;(.*?)&lt;/li&gt;', dotAll: true);
  final matches = pattern.allMatches(input);

  return matches.map((m) {
    var text = m.group(1)!;

    // HTML escape belgilarini oddiy belgilarga aylantiramiz
    return text
        .replaceAll('&laquo;', '«')
        .replaceAll('&raquo;', '»')
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&apos;', "'");
  }).toList();
}

String extractBlockquoteText(String input) {
  final pattern = RegExp(r'&lt;blockquote&gt;(.*?)&lt;/blockquote&gt;', dotAll: true);
  final match = pattern.firstMatch(input);
  return match != null ? match.group(1)!.trim() : '';
}

String extractLastParagraph(String input) {
  final pattern = RegExp(r'&lt;p&gt;(.*?)&lt;/p&gt;', dotAll: true);
  final matches = pattern.allMatches(input).toList();

  if (matches.isNotEmpty) {
    var last = matches.last.group(1)!;

    // HTML escape belgilarini asl belgilar bilan almashtirish
    return last
        .replaceAll('&quot;', '"')
        .replaceAll('&laquo;', '«')
        .replaceAll('&raquo;', '»')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .trim();
  }

  return '';
}

