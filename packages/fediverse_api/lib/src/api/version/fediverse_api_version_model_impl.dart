import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';

import '../../interface_to_impl/interface_to_impl_helper.dart';
import 'fediverse_api_version_model.dart';
// ignore_for_file: no-magic-number
part 'fediverse_api_version_model_impl.freezed.dart';

part 'fediverse_api_version_model_impl.g.dart';

final _logger = Logger('fediverse_api_version_model_impl.dart');

@freezed
@HiveField(0)
class FediverseApiVersion
    with _$FediverseApiVersion
    implements IFediverseApiVersion {
  const factory FediverseApiVersion({
    @HiveField(0) required int major,
    @HiveField(1) required int? minor,
    @HiveField(2) required int? patch,
    @HiveField(3) @JsonKey(name: 'buildNumber') required int? buildNumber,
    @HiveField(4) required String? commit,
  }) = _FediverseApiVersion;

  factory FediverseApiVersion.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$FediverseApiVersionFromJson(json);

  static FediverseApiVersion fromVersionString(
    String fediverseApiVersionString,
  ) {
    var segments = fediverseApiVersionString.split('-');

    String fediverseApiVersionPartString;
    String? buildNumberString;
    String? commitString;
    var length = segments.length;
    if (length > 1) {
      fediverseApiVersionPartString = segments[0];
      buildNumberString = segments[1];
      // ignore: no-magic-number
      if (length > 2) {
        // ignore: no-magic-number
        commitString = segments[2];
      }
    } else {
      fediverseApiVersionPartString = fediverseApiVersionString;
    }

    var fediverseApiVersions = fediverseApiVersionPartString.split('.');

    var major = int.parse(fediverseApiVersions[0]);
    int? minor;
    if (fediverseApiVersions.length > 1) {
      minor = int.parse(fediverseApiVersions[1]);
    }
    int? patch;
    // ignore: no-magic-number
    if (fediverseApiVersions.length > 2) {
      // ignore: no-magic-number
      patch = int.parse(fediverseApiVersions[2]);
    }
    int? buildNumber;
    if (buildNumberString != null) {
      try {
        buildNumber = int.parse(buildNumberString);
      } on Exception catch (e, stackTrace) {
        _logger.warning(
          () => 'failed to parse $buildNumber from $fediverseApiVersionString',
          e,
          stackTrace,
        );
      }
    }

    return FediverseApiVersion(
      major: major,
      minor: minor,
      patch: patch,
      buildNumber: buildNumber,
      commit: commitString,
    );
  }
}

extension IFediverseApiVersionInterfaceExtension on IFediverseApiVersion {
  FediverseApiVersion toFediverseApiVersion({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => FediverseApiVersion(
          major: major,
          minor: minor,
          patch: patch,
          buildNumber: buildNumber,
          commit: commit,
        ),
        forceNewObject: forceNewObject,
      );
}
