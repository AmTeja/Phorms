extension JsonExtensions on Map<String, Object?> {
  String asString(String key) {
    return this[key] as String;
  }
}
