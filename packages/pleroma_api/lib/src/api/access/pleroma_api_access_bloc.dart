import 'package:fediverse_api/fediverse_api.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../feature/pleroma_api_feature_model.dart';
import '../instance/pleroma_api_instance_model.dart';
import 'level/type/pleroma_api_access_level_type_sealed.dart';
import 'pleroma_api_access_model.dart';

abstract class IPleromaApiAccessBloc<T extends IPleromaApiAccess>
    implements IFediverseApiAccessBloc<T> {
  IMastodonApiAccessBloc get mastodonApiAccessBloc;

  static const notImplementedYetReasonId = 'notImplementedYetReasonId';

  static FediverseApiFeatureRequirementState checkPleromaApiAccessFeatureState({
    required IPleromaApiFeature feature,
    required IPleromaApiAccess access,
  }) {
    List<FediverseApiFeatureRequirementState> states;
    if (feature.forceNotImplementedYet == true) {
      states = [
        const FediverseApiFeatureRequirementState.forbidden(
          [
            FediverseApiFeatureRequirementReason(
              name: notImplementedYetReasonId,
              description: 'This feature exist in Mastodon API, '
                  'but not supported in Pleroma yet',
            ),
          ],
        ),
      ];
    } else {
      var mastodonApiFeature = feature.mastodonApiFeature;

      var levelType = access.level.stringValue.toPleromaApiAccessLevelType();

      var scopes = levelType.map<IFediverseApiAccessScopes?>(
        public: (_) => null,
        // ignore:avoid-non-null-assertion
        application: (_) => access.applicationAccessToken!.scopes,
        // ignore:avoid-non-null-assertion
        user: (_) => access.userAccessToken!.scopes,
      );

      states = [
        if (mastodonApiFeature != null)
          IMastodonApiAccessBloc.checkMastodonApiAccessFeatureState(
            feature: mastodonApiFeature,
            access: access,
          ),
        feature.instanceVersionRequirement.check(
          access.instance?.versionAsPleromaApi,
        ),
        feature.accessLevelRequirement.check(access.level),
        feature.accessScopesRequirement.check(scopes),
      ];
    }

    return states.merge();
  }
}

extension IPleromaApiAccessBlocExtension on IPleromaApiAccessBloc {
  FediverseApiFeatureRequirementState checkPleromaApiFeatureState(
    IPleromaApiFeature feature,
  ) =>
      IPleromaApiAccessBloc.checkPleromaApiAccessFeatureState(
        feature: feature,
        access: access,
      );

  Stream<FediverseApiFeatureRequirementState> listenPleromaApiFeatureState(
    IPleromaApiFeature feature,
  ) =>
      accessStream.map(
        (access) => IPleromaApiAccessBloc.checkPleromaApiAccessFeatureState(
          feature: feature,
          access: access,
        ),
      );
}
