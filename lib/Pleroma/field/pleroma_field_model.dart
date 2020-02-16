
import 'package:fedi/mastodon/field/mastodon_field_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_field_model.g.dart';

abstract class IPleromaField implements IMastodonField {

}

@HiveType()
@JsonSerializable()
class PleromaField implements IPleromaField {
  @HiveField(0)
  String name;
  @HiveField(1)
  String value;
  @HiveField(2)
  @JsonKey(name:"verified_at")
  DateTime verifiedAt;


  PleromaField({this.name, this.value, this.verifiedAt});

  factory PleromaField.fromJson(Map<String, dynamic> json) =>
      _$PleromaFieldFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaFieldToJson(this);

  @override
  String toString() {
    return 'PleromaField{name: $name, value: $value}';
  }


}
