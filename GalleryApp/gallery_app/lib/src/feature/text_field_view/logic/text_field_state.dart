class TextFieldState {
  TextFieldState(
      {this.isShowHint = false,
      this.isShowLabel = false,
      this.isShowHelp = false,
      this.isShowError = false,
      this.isShowCounter = false,
      this.isShowPrefix = false,
      this.isShowSuffix = false,
      this.input,
      this.isShowPrefixIcon = false});

  final bool isShowHint;
  final bool isShowLabel;
  final bool isShowHelp;
  final bool isShowError;
  final bool isShowCounter;
  final bool isShowPrefix;
  final bool isShowSuffix;
  final bool isShowPrefixIcon;
  final String? input;

  TextFieldState copyWith(
      {bool? isShowHint,
      bool? isShowLabel,
      bool? isShowHelp,
      bool? isShowError,
      bool? isShowCounter,
      bool? isShowPrefix,
      bool? isShowSuffix,
      bool? isShowPrefixIcon,
      String? input}) {
    return TextFieldState(
        isShowHint: isShowHint ?? this.isShowHint,
        isShowLabel: isShowLabel ?? this.isShowLabel,
        isShowHelp: isShowHelp ?? this.isShowHelp,
        isShowError: isShowError ?? this.isShowError,
        isShowCounter: isShowCounter ?? this.isShowCounter,
        isShowPrefix: isShowPrefix ?? this.isShowPrefix,
        isShowSuffix: isShowSuffix ?? this.isShowSuffix,
        isShowPrefixIcon: isShowPrefixIcon ?? this.isShowPrefixIcon,
        input: input ?? this.input);
  }
}
