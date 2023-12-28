class StringUtils {
  static String collapseText({required String text}) {
    String collaseText = '';
    for (String word in text.split(' ')) {
      collaseText += word.split('').first;
    }
    return collaseText.toUpperCase();
  }
}
