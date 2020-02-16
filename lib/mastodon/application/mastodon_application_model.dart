import 'package:fedi/enum/enum_values.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class IMastodonApplication {
  MastodonApplicationName get name;

  dynamic get website;
}

enum MastodonApplicationName { WEB }

final nameValues = new EnumValues({"Web": MastodonApplicationName.WEB});

class MastodonApplicationNameTypeConverter
    implements JsonConverter<MastodonApplicationName, String> {
  const MastodonApplicationNameTypeConverter();

  @override
  MastodonApplicationName fromJson(String value) => nameValues.map[value];
  @override
  String toJson(MastodonApplicationName value) => nameValues.reverseMap[value];
}
