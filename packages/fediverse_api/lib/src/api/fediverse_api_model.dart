import '../json/json_model.dart';

abstract class IFediverseApiObject implements IJsonObj {}

abstract class IFediverseApiResponsePart implements IFediverseApiObject {}

abstract class IFediverseApiResponse implements IFediverseApiResponsePart {}

abstract class IFediverseApiUnion {
  String get stringValue;
}

typedef UnionStringValueCreator<T> = T Function(String stringValue);

abstract class IFediverseApiUnionHelper {
  static Map<String, T> calculateStringValuesMap<T extends IFediverseApiUnion>(
    List<T> values,
  ) {
    var map = <String, T>{};

    for (final value in values) {
      map[value.stringValue] = value;
    }

    return map;
  }

  static T findByStringValue<T extends IFediverseApiUnion>(
    Map<String, T> map,
    String stringValue, {
    required UnionStringValueCreator<T>? defaultValueCreator,
  }) =>
      // ignore: avoid-non-null-assertion
      map[stringValue] ?? defaultValueCreator!(stringValue);
}
