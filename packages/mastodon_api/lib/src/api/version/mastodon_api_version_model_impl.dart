import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'mastodon_api_version_model.dart';
// ignore_for_file: no-magic-number
part 'mastodon_api_version_model_impl.freezed.dart';

part 'mastodon_api_version_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiVersion
    with _$MastodonApiVersion
    implements IMastodonApiVersion {
  const factory MastodonApiVersion({
    @HiveField(0) required int major,
    @HiveField(1) required int? minor,
    @HiveField(2) required int? patch,
    @HiveField(3) @JsonKey(name: 'build_number') required int? buildNumber,
    @HiveField(4) required String? commit,
  }) = _MastodonApiVersion;

  factory MastodonApiVersion.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiVersionFromJson(json);

  static MastodonApiVersion fromApiVersionString(
    String versionString,
  ) {
    var indexOf = versionString.indexOf(' ');
    var processedVersionString = versionString;
    if (indexOf > 0) {
      processedVersionString = processedVersionString.substring(0, indexOf);
    }
    var mastodonVersion =
        FediverseApiVersion.fromVersionString(processedVersionString);

    return MastodonApiVersion(
      major: mastodonVersion.major,
      minor: mastodonVersion.minor,
      patch: mastodonVersion.patch,
      buildNumber: mastodonVersion.buildNumber,
      commit: mastodonVersion.commit,
    );
  }

  static const v0_9_0 = MastodonApiVersion(
    major: 0,
    minor: 9,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v2_4_0 = MastodonApiVersion(
    major: 2,
    minor: 4,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v2_3_0 = MastodonApiVersion(
    major: 2,
    minor: 3,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v1_1_0 = MastodonApiVersion(
    major: 1,
    minor: 1,
    patch: 0,
    buildNumber: null,
    commit: null,
  );
  static const v3_1_4 = MastodonApiVersion(
    major: 3,
    minor: 1,
    patch: 4,
    buildNumber: null,
    commit: null,
  );
  static const v1_3_0 = MastodonApiVersion(
    major: 1,
    minor: 3,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v1_1_1 = MastodonApiVersion(
    major: 1,
    minor: 1,
    patch: 1,
    buildNumber: null,
    commit: null,
  );

  static const v3_0_0 = MastodonApiVersion(
    major: 3,
    minor: 0,
    patch: 0,
    buildNumber: null,
    commit: null,
  );
  static const v2_4_3 = MastodonApiVersion(
    major: 2,
    minor: 4,
    patch: 3,
    buildNumber: null,
    commit: null,
  );

  static const v3_1_0 = MastodonApiVersion(
    major: 3,
    minor: 1,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v3_1_3 = MastodonApiVersion(
    major: 3,
    minor: 1,
    patch: 3,
    buildNumber: null,
    commit: null,
  );

  static const v1_4_0 = MastodonApiVersion(
    major: 1,
    minor: 4,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v3_2_0 = MastodonApiVersion(
    major: 3,
    minor: 2,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v2_1_0 = MastodonApiVersion(
    major: 2,
    minor: 1,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v2_1_2 = MastodonApiVersion(
    major: 2,
    minor: 1,
    patch: 2,
    buildNumber: null,
    commit: null,
  );

  static const v2_0_0 = MastodonApiVersion(
    major: 2,
    minor: 0,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v2_6_0 = MastodonApiVersion(
    major: 2,
    minor: 6,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v2_9_0 = MastodonApiVersion(
    major: 2,
    minor: 9,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v2_7_0 = MastodonApiVersion(
    major: 2,
    minor: 7,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v2_4_1 = MastodonApiVersion(
    major: 2,
    minor: 4,
    patch: 1,
    buildNumber: null,
    commit: null,
  );

  static const v2_5_0 = MastodonApiVersion(
    major: 2,
    minor: 5,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v2_8_0 = MastodonApiVersion(
    major: 2,
    minor: 8,
    patch: 0,
    buildNumber: null,
    commit: null,
  );

  static const v3_3_0 = MastodonApiVersion(
    major: 3,
    minor: 3,
    patch: 0,
    buildNumber: null,
    commit: null,
  );
}

extension IMastodonApiVersionInterfaceExtension on IMastodonApiVersion {
  MastodonApiVersion toMastodonApiVersion({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiVersion(
          major: major,
          minor: minor,
          patch: patch,
          buildNumber: buildNumber,
          commit: commit,
        ),
        forceNewObject: forceNewObject,
      );
}
