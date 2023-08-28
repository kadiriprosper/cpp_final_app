class GlobalHelpers{
  static stirngModifier(String? body) {
    return (body != null
            ? body
                .replaceAll(RegExp(r'\[|\]'), '')
                .replaceAll('-', '\n\n•') //⚈
                .trim()
            : '')
        .trim();
  }
}