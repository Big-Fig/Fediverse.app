import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_mention_model.dart';

part 'unifedi_api_mention_model_impl.freezed.dart';

part 'unifedi_api_mention_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiMention with _$UnifediApiMention implements IUnifediApiMention {
  const factory UnifediApiMention({
    @HiveField(0) required String acct,
    @HiveField(1) required String id,
    @HiveField(2) required String url,
    @HiveField(3) required String? username,
  }) = _UnifediApiMention;

  factory UnifediApiMention.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiMentionFromJson(json);
}

extension IUnifediApiMentionInterfaceExtension on IUnifediApiMention {
  UnifediApiMention toUnifediApiMention({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiMention(
          acct: acct,
          id: id,
          url: url,
          username: username,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IUnifediApiMentionInterfaceListExtension on List<IUnifediApiMention> {
  List<UnifediApiMention> toUnifediApiMentionList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiMention item) => item.toUnifediApiMention(),
        forceNewObject: forceNewObject,
      );

  List<String> toAccts() => map(
        (unifediApiMention) => unifediApiMention.acct,
      ).toList();
}
