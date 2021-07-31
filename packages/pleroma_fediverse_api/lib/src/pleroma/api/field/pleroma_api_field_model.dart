import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_field_model.g.dart';

var _logger = Logger('pleroma_api_field_model.dart');

abstract class IPleromaApiField implements IMastodonApiField {}

extension IPleromaApiFieldExtension on IPleromaApiField {
  PleromaApiField toPleromaApiField({bool forceNewObject = false}) {
    if (this is PleromaApiField && !forceNewObject) {
      return this as PleromaApiField;
    } else {
      return PleromaApiField(
        name: name,
        value: value,
        verifiedAt: verifiedAt,
      );
    }
  }
}

extension IPleromaApiFieldListExtension on List<IPleromaApiField> {
  List<PleromaApiField> toPleromaApiFields({bool forceNewObject = false}) {
    if (this is List<PleromaApiField> && !forceNewObject) {
      return this as List<PleromaApiField>;
    } else {
      return map(
        (field) => field.toPleromaApiField(forceNewObject: forceNewObject),
      ).toList();
    }
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 37)
@JsonSerializable()
class PleromaApiField implements IPleromaApiField, IJsonObject {
  @override
  @HiveField(0)
  final String? name;
  @override
  @HiveField(1)
  final String? value;
  @override
  @HiveField(2)
  @JsonKey(name: 'verified_at')
  final DateTime? verifiedAt;

  PleromaApiField({
    required this.name,
    required this.value,
    required this.verifiedAt,
  });

  PleromaApiField.only({
    this.name,
    this.value,
    this.verifiedAt,
  });

  static PleromaApiField fromJson(Map<String, dynamic> json) =>
      _$PleromaApiFieldFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiFieldToJson(this);

  @override
  String toString() {
    return 'PleromaApiField{'
        'name: $name, '
        'value: $value, '
        'verifiedAt: $verifiedAt'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiField &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          value == other.value &&
          verifiedAt == other.verifiedAt;

  @override
  int get hashCode => name.hashCode ^ value.hashCode ^ verifiedAt.hashCode;
}
