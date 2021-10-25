import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_poll_option_model.dart';

part 'unifedi_api_poll_option_model_impl.freezed.dart';

part 'unifedi_api_poll_option_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiPollOption
    with _$UnifediApiPollOption
    implements IUnifediApiPollOption {
  const factory UnifediApiPollOption({
    @HiveField(0) required String title,
    @HiveField(1) @JsonKey(name: 'votes_count') required int? votesCount,
  }) = _UnifediApiPollOption;

  factory UnifediApiPollOption.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiPollOptionFromJson(json);
}

extension UnifediApiPollOptionInterfaceExtension on IUnifediApiPollOption {
  UnifediApiPollOption toUnifediApiPollOption({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiPollOption(
          title: title,
          votesCount: votesCount,
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiPollOptionInterfaceListExtension
    on List<IUnifediApiPollOption> {
  List<UnifediApiPollOption> toUnifediApiPollOptionList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiPollOption item) => item.toUnifediApiPollOption(),
        forceNewObject: forceNewObject,
      );

  List<String> toUnifediApiPollOptionTitles() => map(
        (pollOption) => pollOption.title,
      ).toList();
}
