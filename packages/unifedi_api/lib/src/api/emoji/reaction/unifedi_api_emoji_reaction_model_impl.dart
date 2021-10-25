import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../account/unifedi_api_account_model_impl.dart';
import 'unifedi_api_emoji_reaction_model.dart';

part 'unifedi_api_emoji_reaction_model_impl.freezed.dart';

part 'unifedi_api_emoji_reaction_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiEmojiReaction
    with _$UnifediApiEmojiReaction
    implements IUnifediApiEmojiReaction {
  const factory UnifediApiEmojiReaction({
    @HiveField(0) required String name,
    @HiveField(1) required int count,
    @HiveField(2) required bool me,
    @HiveField(3) required List<UnifediApiAccount>? accounts,
    @HiveField(4) required String? url,
    @HiveField(5) required String? staticUrl,
  }) = _UnifediApiEmojiReaction;

  factory UnifediApiEmojiReaction.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiEmojiReactionFromJson(json);
}

extension IUnifediApiEmojiReactionInterfaceExtension
    on IUnifediApiEmojiReaction {
  UnifediApiEmojiReaction toUnifediApiEmojiReaction({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiEmojiReaction(
          name: name,
          count: count,
          me: me,
          staticUrl: staticUrl,
          url: url,
          accounts: accounts?.toUnifediApiAccountList(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

extension IUnifediApiEmojiReactionInterfaceListExtension
    on List<IUnifediApiEmojiReaction> {
  List<UnifediApiEmojiReaction> toUnifediApiEmojiReactionList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiEmojiReaction item) => item.toUnifediApiEmojiReaction(),
        forceNewObject: forceNewObject,
      );
}
