import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/status/post/poll/unifedi_api_post_status_poll_model.dart';

part 'unifedi_api_post_status_poll_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_post_status_poll_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPostStatusPollPleromaAdapter
    with _$UnifediApiPostStatusPollPleromaAdapter
    implements IUnifediApiPostStatusPoll {
  const UnifediApiPostStatusPollPleromaAdapter._();
  const factory UnifediApiPostStatusPollPleromaAdapter(
    @HiveField(0) PleromaApiPostStatusPoll value,
  ) = _UnifediApiPostStatusPollPleromaAdapter;

  @override
  int get expiresInSeconds => value.expiresInSeconds;

  @override
  bool get hideTotals => value.hideTotals;

  @override
  bool get multiple => value.multiple;

  @override
  List<String> get options => value.options;
  factory UnifediApiPostStatusPollPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPostStatusPollPleromaAdapterFromJson(json);
}

extension PleromaApiPostStatusPollUnifediExtension
    on IPleromaApiPostStatusPoll {
  UnifediApiPostStatusPollPleromaAdapter
      toUnifediApiPostStatusPollPleromaAdapter() =>
          UnifediApiPostStatusPollPleromaAdapter(
            toPleromaApiPostStatusPoll(),
          );
}

extension IUnifediApiPostStatusPollPleromaExtension
    on IUnifediApiPostStatusPoll {
  PleromaApiPostStatusPoll toPleromaApiPostStatusPoll() =>
      PleromaApiPostStatusPoll(
        expiresInSeconds: expiresInSeconds,
        hideTotals: hideTotals,
        multiple: multiple,
        options: options,
      );
}

extension PleromaApiPostStatusPollUnifediListExtension
    on List<IPleromaApiPostStatusPoll> {
  List<UnifediApiPostStatusPollPleromaAdapter>
      toUnifediApiPostStatusPollPleromaAdapterList() => map(
            (item) => item.toUnifediApiPostStatusPollPleromaAdapter(),
          ).toList();
}
