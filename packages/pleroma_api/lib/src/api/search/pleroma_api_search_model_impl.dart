import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/pleroma_api_account_model_impl.dart';
import '../status/pleroma_api_status_model_impl.dart';
import '../tag/pleroma_api_tag_model_impl.dart';
import 'pleroma_api_search_model.dart';

part 'pleroma_api_search_model_impl.freezed.dart';

part 'pleroma_api_search_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiSearchResult
    with _$PleromaApiSearchResult
    implements IPleromaApiSearchResult {
  const factory PleromaApiSearchResult({
    @HiveField(0) required List<PleromaApiAccount> accounts,
    @HiveField(1) required List<PleromaApiTag> hashtags,
    @HiveField(2) required List<PleromaApiStatus> statuses,
  }) = _PleromaApiSearchResult;

  factory PleromaApiSearchResult.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiSearchResultFromJson(json);
}

extension IPleromaApiSearchResultInterfaceExtension on IPleromaApiSearchResult {
  PleromaApiSearchResult toPleromaApiSearchResult({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiSearchResult(
          accounts: accounts.toPleromaApiAccountList(
            forceNewObject: forceNewObject,
          ),
          hashtags: hashtags.toPleromaApiTagList(
            forceNewObject: forceNewObject,
          ),
          statuses: statuses.toPleromaApiStatusList(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
