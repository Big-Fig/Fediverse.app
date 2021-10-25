import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../api/account/unifedi_api_account_model.dart';
import '../../../api/emoji/reaction/unifedi_api_emoji_reaction_model.dart';
import '../../account/unifedi_api_account_model_pleroma_adapter.dart';

part 'unifedi_api_status_emoji_reaction_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_status_emoji_reaction_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiStatusEmojiReactionPleromaAdapter
    with _$UnifediApiStatusEmojiReactionPleromaAdapter
    implements IUnifediApiEmojiReaction {
  const UnifediApiStatusEmojiReactionPleromaAdapter._();
  const factory UnifediApiStatusEmojiReactionPleromaAdapter(
    @HiveField(0) PleromaApiStatusEmojiReaction value,
  ) = _UnifediApiStatusEmojiReactionPleromaAdapter;

  @override
  List<IUnifediApiAccount>? get accounts =>
      value.accounts?.toUnifediApiAccountPleromaAdapterList();

  @override
  int get count => value.count;

  @override
  bool get me => value.me;

  @override
  String get name => value.name;

  @override
  String? get staticUrl => value.staticUrl;

  @override
  String? get url => value.url;
  factory UnifediApiStatusEmojiReactionPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiStatusEmojiReactionPleromaAdapterFromJson(json);
}

mixin UnifediApiStatusEmojiReactionPleromaAdapterMixin
    implements IUnifediApiEmojiReaction {
  PleromaApiStatusEmojiReaction get value;
}

extension PleromaApiStatusEmojiReactionUnifediExtension
    on IPleromaApiStatusEmojiReaction {
  UnifediApiStatusEmojiReactionPleromaAdapter
      toUnifediApiStatusEmojiReactionPleromaAdapter() =>
          UnifediApiStatusEmojiReactionPleromaAdapter(
            toPleromaApiStatusEmojiReaction(),
          );
}

extension PleromaApiStatusEmojiReactionUnifediListExtension
    on List<IPleromaApiStatusEmojiReaction> {
  List<UnifediApiStatusEmojiReactionPleromaAdapter>
      toUnifediApiStatusEmojiReactionPleromaAdapterList() => map(
            (item) => item.toUnifediApiStatusEmojiReactionPleromaAdapter(),
          ).toList();
}
