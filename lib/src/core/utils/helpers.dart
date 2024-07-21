


String capitalize(String text) {
  if (text.isEmpty) {
    return text;
  }
  if (text.length == 1) {
    return text.toUpperCase();
  }
  return text[0].toUpperCase() + text.substring(1);
}


String getPrefix(String? prefix, String defaultPrefix) {
  return prefix == null ? defaultPrefix.toLowerCase() : '$prefix${capitalize(defaultPrefix)}';
}