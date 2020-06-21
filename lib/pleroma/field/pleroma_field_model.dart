import 'package:fedi/mastodon/field/mastodon_field_model.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';

part 'pleroma_field_model.g.dart';

var _logger = Logger("pleroma_field_model.dart");

abstract class IPleromaField implements IMastodonField {}

@HiveType()
@JsonSerializable()
class PleromaField implements IPleromaField {
  @override
  @HiveField(0)
  String name;
  @override
  @HiveField(1)
  String value;
  @override
  @HiveField(2)
  @JsonKey(name: "verified_at")
  DateTime verifiedAt;

  PleromaField({this.name, this.value, this.verifiedAt});

  factory PleromaField.fromJson(Map<String, dynamic> json) =>
      _$PleromaFieldFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaFieldToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaField &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          value == other.value &&
          verifiedAt == other.verifiedAt;

  @override
  int get hashCode => name.hashCode ^ value.hashCode ^ verifiedAt.hashCode;

  @override
  String toString() {
    return 'PleromaField{name: $name, value: $value}';
  }

  @override
  String get valueAsRawUrl {
    if (value?.isNotEmpty == true) {
      try {
        var parsed = HtmlParser.parseHTML(value);
        var allLinkElements = parsed.getElementsByTagName("a");
        if (allLinkElements?.isNotEmpty == true) {
          return allLinkElements.first.attributes["href"];
        } else {
          return value;
        }
      } catch (e, stackTrace) {
        _logger.warning(() => "failed to parse URL from $value", e, stackTrace);
        return value;
      }
    } else {
      return value;
    }
  }
}
