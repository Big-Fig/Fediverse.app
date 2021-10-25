import 'package:fediverse_api/fediverse_api.dart';

import '../feature/mastodon_api_feature_model.dart';
import '../instance/mastodon_api_instance_model.dart';
import 'level/type/mastodon_api_access_level_type_sealed.dart';
import 'mastodon_api_access_model.dart';

abstract class IMastodonApiAccessBloc<T extends IMastodonApiAccess>
    implements IFediverseApiAccessBloc<T> {
  static FediverseApiFeatureRequirementState
      checkMastodonApiAccessFeatureState({
    required IMastodonApiFeature<IMastodonApiAccess> feature,
    required IMastodonApiAccess access,
  }) {
    var levelType = access.level.stringValue.toMastodonApiAccessLevelType();

    var scopes = levelType.map<IFediverseApiAccessScopes?>(
      public: (_) => null,
      // ignore: avoid-non-null-assertion
      application: (_) => access.applicationAccessToken!.scopes,
      // ignore: avoid-non-null-assertion
      user: (_) => access.userAccessToken!.scopes,
    );

    var states = [
      feature.instanceVersionRequirement.check(
        access.instance?.versionAsMastodonApi,
      ),
      feature.accessLevelRequirement.check(access.level),
      feature.accessScopesRequirement.check(scopes),
    ];

    return states.merge();
  }
}

extension IMastodonApiAccessBlocExtension on IMastodonApiAccessBloc {
  FediverseApiFeatureRequirementState checkMastodonApiFeatureState(
    IMastodonApiFeature feature,
  ) =>
      IMastodonApiAccessBloc.checkMastodonApiAccessFeatureState(
        feature: feature,
        access: access,
      );

  Stream<FediverseApiFeatureRequirementState> listenMastodonApiFeatureState(
    IMastodonApiFeature feature,
  ) =>
      accessStream.map(
        (access) => IMastodonApiAccessBloc.checkMastodonApiAccessFeatureState(
          feature: feature,
          access: access,
        ),
      );
}
