import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../api/poll/option/unifedi_api_poll_option_model.dart';

part 'unifedi_api_poll_option_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_poll_option_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPollOptionPleromaAdapter
    with _$UnifediApiPollOptionPleromaAdapter
    implements IUnifediApiPollOption {
  const UnifediApiPollOptionPleromaAdapter._();
  const factory UnifediApiPollOptionPleromaAdapter(
    @HiveField(0) PleromaApiPollOption value,
  ) = _UnifediApiPollOptionPleromaAdapter;

  @override
  String get title => value.title;

  @override
  int? get votesCount => value.votesCount;
  factory UnifediApiPollOptionPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPollOptionPleromaAdapterFromJson(json);
}

extension PleromaApiPollOptionUnifediExtension on IPleromaApiPollOption {
  UnifediApiPollOptionPleromaAdapter toUnifediApiPollOptionPleromaAdapter() =>
      UnifediApiPollOptionPleromaAdapter(
        toPleromaApiPollOption(),
      );
}

extension PleromaApiPollOptionUnifediListExtension
    on List<IPleromaApiPollOption> {
  List<UnifediApiPollOptionPleromaAdapter>
      toUnifediApiPollOptionPleromaAdapterList() => map(
            (item) => item.toUnifediApiPollOptionPleromaAdapter(),
          ).toList();
}
