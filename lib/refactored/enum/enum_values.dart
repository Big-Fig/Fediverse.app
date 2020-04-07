class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> _reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (_reverseMap == null) {
      _reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return _reverseMap;
  }
}
