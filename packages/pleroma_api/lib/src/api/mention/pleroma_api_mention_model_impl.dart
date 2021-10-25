import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_mention_model.dart';

part 'pleroma_api_mention_model_impl.freezed.dart';

part 'pleroma_api_mention_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiMention with _$PleromaApiMention implements IPleromaApiMention {
  const factory PleromaApiMention({
    @HiveField(0) required String acct,
    @HiveField(1) required String id,
    @HiveField(2) required String url,
    @HiveField(3) required String? username,
  }) = _PleromaApiMention;

  factory PleromaApiMention.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiMentionFromJson(json);
}

extension IPleromaApiMentionInterfaceExtension on IPleromaApiMention {
  PleromaApiMention toPleromaApiMention({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiMention(
          acct: acct,
          id: id,
          url: url,
          username: username,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiMentionInterfaceListExtension on List<IPleromaApiMention> {
  List<PleromaApiMention> toPleromaApiMentionList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiMention item) => item.toPleromaApiMention(),
        forceNewObject: forceNewObject,
      );

  List<String> toAccts() => map(
        (pleromaApiMention) => pleromaApiMention.acct,
      ).toList();
}
