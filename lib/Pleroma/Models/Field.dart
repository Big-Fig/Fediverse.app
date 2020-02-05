
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Field.g.dart';

@HiveType()
@JsonSerializable()
class Field {
  @HiveField(0)
  String name;
  @HiveField(1)
  String value;

  Field({this.name, this.value});

  factory Field.fromJson(Map<String, dynamic> json) =>
      _$FieldFromJson(json);

  Map<String, dynamic> toJson() => _$FieldToJson(this);

  @override
  String toString() {
    return 'Field{name: $name, value: $value}';
  }


}
