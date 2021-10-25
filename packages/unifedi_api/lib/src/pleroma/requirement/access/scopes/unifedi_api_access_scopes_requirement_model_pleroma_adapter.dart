import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/access/scopes/unifedi_api_access_scopes_model.dart';
import '../../../../api/requirement/access/scopes/unifedi_api_access_scopes_requirement_model.dart';
import '../../../access/scopes/unifedi_api_access_scopes_model_pleroma_adapter.dart';

part 'unifedi_api_access_scopes_requirement_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_access_scopes_requirement_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessScopesRequirementPleromaAdapter
    with _$UnifediApiAccessScopesRequirementPleromaAdapter
    implements IUnifediApiAccessScopesRequirement {
  const UnifediApiAccessScopesRequirementPleromaAdapter._();
  const factory UnifediApiAccessScopesRequirementPleromaAdapter(
    @HiveField(0) PleromaApiAccessScopesRequirement value,
  ) = _UnifediApiAccessScopesRequirementPleromaAdapter;

  FediverseApiFeatureRequirementState check(IUnifediApiAccessScopes data) {
    var accessScopes = data as UnifediApiAccessScopesPleromaAdapter;

    return value.check(accessScopes.value);
  }

  @override
  List<IUnifediApiAccessScopes> get scopesVariants => value.scopesVariants
      .map(
        (item) => item.toUnifediApiAccessScopesPleromaAdapter(),
      )
      .toList();
  factory UnifediApiAccessScopesRequirementPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessScopesRequirementPleromaAdapterFromJson(json);
}

extension PleromaApiFeatureUnifediExtension
    on IPleromaApiAccessScopesRequirement {
  UnifediApiAccessScopesRequirementPleromaAdapter
      toUnifediApiAccessScopesRequirementPleromaAdapter() =>
          UnifediApiAccessScopesRequirementPleromaAdapter(
            toPleromaApiAccessScopesRequirement(),
          );
}
