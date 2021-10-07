import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_settings_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'pagination_settings_model.g.dart';

@freezed
@HiveType(typeId: -32 + 95)
class PaginationSettings
    with _$PaginationSettings
    implements IJsonObj, ISettings<PaginationSettings> {
  const PaginationSettings._();

  const factory PaginationSettings({
    @HiveField(0) @JsonKey(name: 'page_size') required String pageSizeString,
  }) = _PaginationSettings;

  static PaginationSettings fromEnum({
    required PaginationPageSize pageSize,
  }) =>
      PaginationSettings(
        pageSizeString: pageSize.toJsonValue(),
      );

  PaginationPageSize get pageSize => pageSizeString.toPaginationPageSize();

  factory PaginationSettings.fromJson(Map<String, dynamic> json) =>
      _$PaginationSettingsFromJson(json);

  @override
  PaginationSettings clone() => copyWith();
}
