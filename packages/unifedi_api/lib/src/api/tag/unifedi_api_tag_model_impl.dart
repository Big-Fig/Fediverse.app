import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'history/unifedi_api_tag_history_model_impl.dart';
import 'unifedi_api_tag_model.dart';

part 'unifedi_api_tag_model_impl.freezed.dart';

part 'unifedi_api_tag_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class UnifediApiTag with _$UnifediApiTag implements IUnifediApiTag {
  const factory UnifediApiTag({
    @HiveField(0) required String name,
    @HiveField(1) required String? url,
    @HiveField(2) required UnifediApiTagHistory? history,
    @HiveField(3) required String? id,
    @JsonKey(name: 'last_status_at')
    @HiveField(4)
        required DateTime? lastStatusAt,
    @JsonKey(name: 'statuses_count') @HiveField(5) required int? statusesCount,
  }) = _UnifediApiTag;

  factory UnifediApiTag.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiTagFromJson(json);

  static List<UnifediApiTag>? fromJsonListOrNullOnError(dynamic json) =>
      JsonParseHelper.fromJsonOrNullOnError(
        json,
        (dynamic json) {
          var iterable = json as Iterable;

          return iterable
              .map(
                (dynamic item) =>
                    UnifediApiTag.fromJson(item as Map<String, dynamic>),
              )
              .toList();
        },
      );
}

extension IUnifediApiTagInterfaceExtension on IUnifediApiTag {
  UnifediApiTag toUnifediApiTag({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiTag(
          name: name,
          url: url,
          history: history?.toUnifediApiTagHistory(),
          id: id,
          lastStatusAt: lastStatusAt,
          statusesCount: statusesCount,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IUnifediApiTagInterfaceListExtension on List<IUnifediApiTag> {
  List<UnifediApiTag> toUnifediApiTagList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiTag item) => item.toUnifediApiTag(),
        forceNewObject: forceNewObject,
      );
}
