import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_poll_option_model.dart';

part 'pleroma_api_poll_option_model_impl.freezed.dart';

part 'pleroma_api_poll_option_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiPollOption
    with _$PleromaApiPollOption
    implements IPleromaApiPollOption {
  const factory PleromaApiPollOption({
    @HiveField(0) required String title,
    @HiveField(1) @JsonKey(name: 'votes_count') required int? votesCount,
  }) = _PleromaApiPollOption;

  factory PleromaApiPollOption.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiPollOptionFromJson(json);
}

extension PleromaApiPollOptionInterfaceExtension on IPleromaApiPollOption {
  PleromaApiPollOption toPleromaApiPollOption({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiPollOption(
          title: title,
          votesCount: votesCount,
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiPollOptionInterfaceListExtension
    on List<IPleromaApiPollOption> {
  List<PleromaApiPollOption> toPleromaApiPollOptionList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiPollOption item) => item.toPleromaApiPollOption(),
        forceNewObject: forceNewObject,
      );

  List<String> toPleromaApiPollOptionTitles() => map(
        (pollOption) => pollOption.title,
      ).toList();
}
