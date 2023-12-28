class CupertinoState {
  CupertinoState({this.sliderValue = 0.0, this.switchValue = false});

  final double sliderValue;
  final bool switchValue;
  CupertinoState copyWith({double? sliderValue, bool? switchValue}) {
    return CupertinoState(
        sliderValue: sliderValue ?? this.sliderValue,
        switchValue: switchValue ?? this.switchValue);
  }
}
