import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../api/mention/unifedi_api_mention_model.dart';

part 'unifedi_api_mention_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_mention_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMentionPleromaAdapter
    with _$UnifediApiMentionPleromaAdapter
    implements IUnifediApiMention {
  const UnifediApiMentionPleromaAdapter._();
  const factory UnifediApiMentionPleromaAdapter(
    @HiveField(0) PleromaApiMention value,
  ) = _UnifediApiMentionPleromaAdapter;

  @override
  String get acct => value.acct;

  @override
  String get id => value.id;

  @override
  String? get username => value.username;

  @override
  String get url => value.url;
  factory UnifediApiMentionPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMentionPleromaAdapterFromJson(json);
}

extension PleromaApiMentionUnifediExtension on IPleromaApiMention {
  UnifediApiMentionPleromaAdapter toUnifediApiMentionPleromaAdapter() =>
      UnifediApiMentionPleromaAdapter(
        toPleromaApiMention(),
      );
}

extension PleromaApiMentionUnifediListExtension on List<IPleromaApiMention> {
  List<UnifediApiMentionPleromaAdapter>
      toUnifediApiMentionPleromaAdapterList() => map(
            (item) => item.toUnifediApiMentionPleromaAdapter(),
          ).toList();
}
