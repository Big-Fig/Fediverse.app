import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import 'pleroma_api_version_model.dart';
// ignore_for_file: no-magic-number
part 'pleroma_api_version_model_impl.freezed.dart';

part 'pleroma_api_version_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiVersion with _$PleromaApiVersion implements IPleromaApiVersion {
  const factory PleromaApiVersion({
    @HiveField(0)
    @JsonKey(name: 'mastodon_compatibility_version')
        required MastodonApiVersion mastodonCompatibilityVersion,
    @HiveField(1) required int major,
    @HiveField(2) required int? minor,
    @HiveField(3) required int? patch,
    @HiveField(4) @JsonKey(name: 'build_number') required int? buildNumber,
    @HiveField(5) required String? commit,
  }) = _PleromaApiVersion;

  factory PleromaApiVersion.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiVersionFromJson(json);

  static final versionRegex = RegExp(r'(.*) \(compatible; Pleroma (.*)\)');

  static PleromaApiVersion fromApiVersionString(
    String versionString,
  ) {
    // ignore: avoid-non-null-assertion
    var match = versionRegex.firstMatch(versionString)!;
    // ignore: avoid-non-null-assertion
    var mastodonApiVersionString = match.group(1)!;
    // ignore: avoid-non-null-assertion
    var pleromaApiVersionString = match.group(2)!;
    var mastodonVersion =
        FediverseApiVersion.fromVersionString(mastodonApiVersionString);
    var pleromaVersion =
        FediverseApiVersion.fromVersionString(pleromaApiVersionString);

    return PleromaApiVersion(
      major: pleromaVersion.major,
      minor: pleromaVersion.minor,
      patch: pleromaVersion.patch,
      buildNumber: pleromaVersion.buildNumber,
      commit: pleromaVersion.commit,
      mastodonCompatibilityVersion: MastodonApiVersion(
        major: mastodonVersion.major,
        minor: mastodonVersion.minor,
        patch: mastodonVersion.patch,
        buildNumber: mastodonVersion.buildNumber,
        commit: mastodonVersion.commit,
      ),
    );
  }
}

extension IPleromaApiVersionInterfaceExtension on IPleromaApiVersion {
  PleromaApiVersion toPleromaApiVersion({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiVersion(
          mastodonCompatibilityVersion:
              mastodonCompatibilityVersion.toMastodonApiVersion(
            forceNewObject: forceNewObject,
          ),
          major: major,
          minor: minor,
          patch: patch,
          buildNumber: buildNumber,
          commit: commit,
        ),
        forceNewObject: forceNewObject,
      );
}
