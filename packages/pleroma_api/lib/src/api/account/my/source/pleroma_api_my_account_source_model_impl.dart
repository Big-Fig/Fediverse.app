import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
import '../../../field/pleroma_api_field_model_impl.dart';
import 'pleroma_api_my_account_source_model.dart';

part 'pleroma_api_my_account_source_model_impl.freezed.dart';

part 'pleroma_api_my_account_source_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiMyAccountSource
    with _$PleromaApiMyAccountSource
    implements IPleromaApiMyAccountSource {
  const factory PleromaApiMyAccountSource({
    @HiveField(1) required String? privacy,
    @HiveField(2) required bool? sensitive,
    @HiveField(3) required String? language,
    @HiveField(4) required String? note,
    @HiveField(5) required List<PleromaApiField>? fields,
    @HiveField(6)
    @JsonKey(name: 'follow_requests_count')
        required int? followRequestsCount,
    @HiveField(7) required PleromaApiMyAccountSourcePleromaPart? pleroma,
  }) = _PleromaApiMyAccountSource;

  factory PleromaApiMyAccountSource.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiMyAccountSourceFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class PleromaApiMyAccountSourcePleromaPart
    with _$PleromaApiMyAccountSourcePleromaPart
    implements IPleromaApiMyAccountSourcePleromaPart {
  const factory PleromaApiMyAccountSourcePleromaPart({
    @HiveField(1) @JsonKey(name: 'show_role') required bool? showRole,
    @HiveField(2) @JsonKey(name: 'no_rich_text') required bool? noRichText,
    @HiveField(3) required bool? discoverable,
    @HiveField(4) @JsonKey(name: 'actor_type') required String? actorType,
  }) = _PleromaApiMyAccountSourcePleromaPart;

  factory PleromaApiMyAccountSourcePleromaPart.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiMyAccountSourcePleromaPartFromJson(json);
}

extension IPleromaApiMyAccountSourcePleromaPartExtension
    on IPleromaApiMyAccountSourcePleromaPart {
  PleromaApiMyAccountSourcePleromaPart toPleromaApiMyAccountSourcePleromaPart({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiMyAccountSourcePleromaPart(
          showRole: showRole,
          noRichText: noRichText,
          discoverable: discoverable,
          actorType: actorType,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiMyAccountSourceExtension on IPleromaApiMyAccountSource {
  PleromaApiMyAccountSource toPleromaApiMyAccountSource({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiMyAccountSource(
          privacy: privacy,
          sensitive: sensitive,
          language: language,
          note: note,
          fields: fields?.toPleromaApiFieldList(
            forceNewObject: forceNewObject,
          ),
          followRequestsCount: followRequestsCount,
          pleroma: pleroma?.toPleromaApiMyAccountSourcePleromaPart(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
