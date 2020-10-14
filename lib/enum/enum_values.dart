class EnumValues<T> {
  Map<String, T> valueToEnumMap;
  final Map<T, String> enumToValueMap;

  EnumValues(this.valueToEnumMap)
      : enumToValueMap = valueToEnumMap.map((k, v) => MapEntry(v, k));

  List<T> valuesWithoutSelected(List<T> valuesToExclude) =>
      valueToEnumMap.values
          .where((value) => !valuesToExclude.contains(value))
          .toList();
}
