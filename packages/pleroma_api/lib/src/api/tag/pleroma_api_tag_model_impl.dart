import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';

import 'history/item/pleroma_api_tag_history_item_model_impl.dart';
import 'pleroma_api_tag_model.dart';

part 'pleroma_api_tag_model_impl.freezed.dart';

part 'pleroma_api_tag_model_impl.g.dart';

final _logger = Logger('pleroma_api_tag_model_impl.dart');

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class PleromaApiTag with _$PleromaApiTag implements IPleromaApiTag {
  const factory PleromaApiTag({
    @HiveField(0) required String name,
    @HiveField(1) required String url,
    @HiveField(2) required List<PleromaApiTagHistoryItem>? history,
  }) = _PleromaApiTag;

  factory PleromaApiTag.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiTagFromJson(json);

  static List<PleromaApiTag>? fromJsonListOrNullOnError(dynamic json) =>
      JsonParseHelper.fromJsonOrNullOnError(
        json,
        (dynamic json) {
          var iterable = json as Iterable;
          try {
            return iterable
                .map(
                  (dynamic item) => item is String
                      ? PleromaApiTag(
                          name: item,
                          url: '/tag/$item',
                          history: null,
                        )
                      : PleromaApiTag.fromJson(item as Map<String, dynamic>),
                )
                .toList();
          } on Exception catch (e, stackTrace) {
            _logger.warning(
              'failed to fromJsonListOrNullOnError',
              e,
              stackTrace,
            );

            return null;
          }
        },
      );
}

extension IPleromaApiTagInterfaceExtension on IPleromaApiTag {
  PleromaApiTag toPleromaApiTag({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiTag(
          name: name,
          url: url,
          history: history?.toPleromaApiTagHistoryItemList(),
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiTagInterfaceListExtension on List<IPleromaApiTag> {
  List<PleromaApiTag> toPleromaApiTagList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiTag item) => item.toPleromaApiTag(),
        forceNewObject: forceNewObject,
      );
}
