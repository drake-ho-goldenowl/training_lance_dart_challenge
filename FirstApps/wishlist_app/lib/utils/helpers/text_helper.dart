class StringHelper {
  bool isNotNullOrEmpty(String? text) => text != null && text.isNotEmpty;

  bool isNullOrEmpty(String? text) {
    if (text == null) return true;
    return text.isEmpty;
  }
}
