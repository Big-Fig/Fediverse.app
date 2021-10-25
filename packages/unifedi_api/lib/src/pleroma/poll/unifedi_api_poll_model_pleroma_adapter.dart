import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../api/poll/option/unifedi_api_poll_option_model.dart';
import '../../api/poll/unifedi_api_poll_model.dart';
import 'option/unifedi_api_poll_option_model_pleroma_adapter.dart';

part 'unifedi_api_poll_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_poll_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPollPleromaAdapter
    with _$UnifediApiPollPleromaAdapter
    implements IUnifediApiPoll {
  const UnifediApiPollPleromaAdapter._();
  const factory UnifediApiPollPleromaAdapter(
    @HiveField(0) PleromaApiPoll value,
  ) = _UnifediApiPollPleromaAdapter;

  @override
  bool get expired => value.expired;

  @override
  DateTime? get expiresAt => value.expiresAt;

  @override
  String? get id => value.id;

  @override
  bool get multiple => value.multiple;

  @override
  List<IUnifediApiPollOption> get options =>
      value.options.toUnifediApiPollOptionPleromaAdapterList();

  @override
  List<int>? get ownVotes => value.ownVotes;

  @override
  bool? get voted => value.voted;

  @override
  int? get votersCount => value.votersCount;

  @override
  int? get votesCount => value.votesCount;
  factory UnifediApiPollPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPollPleromaAdapterFromJson(json);
}

extension PleromaApiPollUnifediExtension on IPleromaApiPoll {
  UnifediApiPollPleromaAdapter toUnifediApiPollPleromaAdapter() =>
      UnifediApiPollPleromaAdapter(
        toPleromaApiPoll(),
      );
}

extension PleromaApiPollUnifediListExtension on List<IPleromaApiPoll> {
  List<UnifediApiPollPleromaAdapter> toUnifediApiPollPleromaAdapterList() =>
      map(
        (item) => item.toUnifediApiPollPleromaAdapter(),
      ).toList();
}
