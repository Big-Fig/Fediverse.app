import 'dart:convert';

import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pagination_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 95)
class PaginationSettings implements IJsonObject, ISettings<PaginationSettings> {
  @HiveField(0)
  @JsonKey(name: "page_size")
  final String? pageSize;

  PaginationPageSize? get pageSizeAsUiSettingsFontSize =>
      pageSize?.toPaginationPageSize();

  PaginationSettings({
    required this.pageSize,
  });

  factory PaginationSettings.fromJson(Map<String, dynamic> json) =>
      _$PaginationSettingsFromJson(json);

  factory PaginationSettings.fromJsonString(String jsonString) =>
      _$PaginationSettingsFromJson(jsonDecode(jsonString));

  static List<PaginationSettings> listFromJsonString(String str) =>
      List<PaginationSettings>.from(
        json.decode(str).map((x) => PaginationSettings.fromJson(x)),
      );

  @override
  Map<String, dynamic> toJson() => _$PaginationSettingsToJson(this);

  String toJsonString() => jsonEncode(_$PaginationSettingsToJson(this));

  @override
  PaginationSettings clone() => copyWith();

  PaginationSettings copyWith({
    String? pageSize,
  }) =>
      PaginationSettings(
        pageSize: pageSize ?? this.pageSize,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationSettings &&
          runtimeType == other.runtimeType &&
          pageSize == other.pageSize;

  @override
  int get hashCode => pageSize.hashCode;
}
