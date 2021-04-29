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
  final String pageSizeString;

  PaginationPageSize get pageSize =>
      pageSizeString.toPaginationPageSize();

  PaginationSettings({
    required this.pageSizeString,
  });

  PaginationSettings.fromEnum({
    required PaginationPageSize pageSize,
  }) : this(pageSizeString: pageSize.toJsonValue());

  static PaginationSettings fromJson(Map<String, dynamic> json) =>
      _$PaginationSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PaginationSettingsToJson(this);

  @override
  PaginationSettings clone() => copyWith();

  PaginationSettings copyWith({
    PaginationPageSize? pageSize,
  }) =>
      PaginationSettings.fromEnum(
        pageSize: pageSize ?? this.pageSize,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationSettings &&
          runtimeType == other.runtimeType &&
          pageSizeString == other.pageSizeString;

  @override
  int get hashCode => pageSizeString.hashCode;

  @override
  String toString() {
    return 'PaginationSettings{pageSizeString: $pageSizeString}';
  }
}
