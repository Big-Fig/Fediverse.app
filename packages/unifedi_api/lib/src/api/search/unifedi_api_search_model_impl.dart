import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/unifedi_api_account_model_impl.dart';
import '../status/unifedi_api_status_model_impl.dart';
import '../tag/unifedi_api_tag_model_impl.dart';
import 'unifedi_api_search_model.dart';

part 'unifedi_api_search_model_impl.freezed.dart';

part 'unifedi_api_search_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiSearchResult
    with _$UnifediApiSearchResult
    implements IUnifediApiSearchResult {
  const factory UnifediApiSearchResult({
    @HiveField(0) required List<UnifediApiAccount> accounts,
    @HiveField(1) required List<UnifediApiTag> hashtags,
    @HiveField(2) required List<UnifediApiStatus> statuses,
  }) = _UnifediApiSearchResult;

  factory UnifediApiSearchResult.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiSearchResultFromJson(json);
}

extension IUnifediApiSearchResultInterfaceExtension on IUnifediApiSearchResult {
  UnifediApiSearchResult toUnifediApiSearchResult({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiSearchResult(
          accounts: accounts.toUnifediApiAccountList(
            forceNewObject: forceNewObject,
          ),
          hashtags: hashtags.toUnifediApiTagList(
            forceNewObject: forceNewObject,
          ),
          statuses: statuses.toUnifediApiStatusList(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
