import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../api/account/unifedi_api_account_model.dart';
import '../../api/search/unifedi_api_search_model.dart';
import '../../api/status/unifedi_api_status_model.dart';
import '../../api/tag/unifedi_api_tag_model.dart';
import '../account/unifedi_api_account_model_pleroma_adapter.dart';
import '../status/unifedi_api_status_model_pleroma_adapter.dart';
import '../tag/unifedi_api_tag_model_pleroma_adapter.dart';

part 'unifedi_api_search_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_search_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiSearchResultPleromaAdapter
    with _$UnifediApiSearchResultPleromaAdapter
    implements IUnifediApiSearchResult {
  const UnifediApiSearchResultPleromaAdapter._();
  const factory UnifediApiSearchResultPleromaAdapter(
    @HiveField(0) PleromaApiSearchResult value,
  ) = _UnifediApiSearchResultPleromaAdapter;

  @override
  List<IUnifediApiAccount> get accounts =>
      value.accounts.toUnifediApiAccountPleromaAdapterList();

  @override
  List<IUnifediApiTag> get hashtags =>
      value.hashtags.toUnifediApiTagPleromaAdapterList();

  @override
  List<IUnifediApiStatus> get statuses =>
      value.statuses.toUnifediApiStatusPleromaAdapterList();
  factory UnifediApiSearchResultPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiSearchResultPleromaAdapterFromJson(json);
}

extension PleromaApiSearchResultUnifediExtension on IPleromaApiSearchResult {
  UnifediApiSearchResultPleromaAdapter
      toUnifediApiSearchResultPleromaAdapter() =>
          UnifediApiSearchResultPleromaAdapter(
            toPleromaApiSearchResult(),
          );
}

extension PleromaApiSearchResultUnifediListExtension
    on List<IPleromaApiSearchResult> {
  List<UnifediApiSearchResultPleromaAdapter>
      toUnifediApiSearchResultPleromaAdapterList() => map(
            (item) => item.toUnifediApiSearchResultPleromaAdapter(),
          ).toList();
}
