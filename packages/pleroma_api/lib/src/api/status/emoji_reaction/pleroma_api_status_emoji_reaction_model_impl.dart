import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../account/pleroma_api_account_model_impl.dart';
import 'pleroma_api_status_emoji_reaction_model.dart';

part 'pleroma_api_status_emoji_reaction_model_impl.freezed.dart';

part 'pleroma_api_status_emoji_reaction_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiStatusEmojiReaction
    with _$PleromaApiStatusEmojiReaction
    implements IPleromaApiStatusEmojiReaction {
  const factory PleromaApiStatusEmojiReaction({
    @HiveField(0) required String name,
    @HiveField(1) required int count,
    @HiveField(2) required bool me,
    @HiveField(3) required List<PleromaApiAccount>? accounts,
    @HiveField(4) required String? url,
    @HiveField(5) required String? staticUrl,
  }) = _PleromaApiStatusEmojiReaction;

  factory PleromaApiStatusEmojiReaction.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiStatusEmojiReactionFromJson(json);
}

extension IPleromaApiStatusEmojiReactionInterfaceExtension
    on IPleromaApiStatusEmojiReaction {
  PleromaApiStatusEmojiReaction toPleromaApiStatusEmojiReaction({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiStatusEmojiReaction(
          name: name,
          count: count,
          me: me,
          staticUrl: staticUrl,
          url: url,
          accounts: accounts?.toPleromaApiAccountList(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiStatusEmojiReactionInterfaceListExtension
    on List<IPleromaApiStatusEmojiReaction> {
  List<PleromaApiStatusEmojiReaction> toPleromaApiStatusEmojiReactionList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiStatusEmojiReaction item) =>
            item.toPleromaApiStatusEmojiReaction(),
        forceNewObject: forceNewObject,
      );
}
