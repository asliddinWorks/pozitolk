String? extractYouTubeUrl(String html) {
  final RegExp regExp = RegExp(r'src="([^"]+)"');
  final match = regExp.firstMatch(html);
  return match?.group(1);
}