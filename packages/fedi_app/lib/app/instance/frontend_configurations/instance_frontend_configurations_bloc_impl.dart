import 'dart:ui';

import 'package:fedi_app/app/instance/frontend_configurations/instance_frontend_configurations_bloc.dart';
import 'package:fedi_app/app/instance/frontend_configurations/local_preferences/instance_frontend_configurations_local_preference_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('instance_frontend_configurations_bloc_impl.dart');

class InstanceFrontendConfigurationsBloc extends AsyncInitLoadingBloc
    implements IInstanceFrontendConfigurationsBloc {
  final IUnifediApiInstanceService unifediApiInstanceService;
  final IInstanceFrontendConfigurationsLocalPreferenceBloc
      instanceFrontendConfigurationsLocalPreferenceBloc;

  InstanceFrontendConfigurationsBloc({
    required this.unifediApiInstanceService,
    required this.instanceFrontendConfigurationsLocalPreferenceBloc,
  });

  @override
  Future<void> internalAsyncInit() async {
    try {
      var featureSupported = unifediApiInstanceService.isFeatureSupported(
        unifediApiInstanceService.getFrontendConfigurationsFeature,
      );
      if (featureSupported) {
        var frontendConfigurations =
            await unifediApiInstanceService.getFrontendConfigurations();

        await instanceFrontendConfigurationsLocalPreferenceBloc
            .setValue(frontendConfigurations);
      }
      // ignore: avoid_catches_without_on_clauses
    } catch (e, stackTrace) {
      _logger.warning(
        () => 'error during loading frontendConfigurations',
        e,
        stackTrace,
      );
    }
  }

  IUnifediApiFrontendConfigurations? get instanceFrontendConfigurations =>
      instanceFrontendConfigurationsLocalPreferenceBloc.value;

  Stream<IUnifediApiFrontendConfigurations?>
      get instanceFrontendConfigurationsStream =>
          instanceFrontendConfigurationsLocalPreferenceBloc.stream;

  @override
  String? get backgroundImage => instanceFrontendConfigurations?.background;

  @override
  Stream<String?> get backgroundImageStream =>
      instanceFrontendConfigurationsStream.map(
        (instanceFrontendConfigurations) =>
            instanceFrontendConfigurations?.background,
      );

  @override
  Color? get brandColor => instanceFrontendConfigurations?.brandColor;

  @override
  Stream<Color?> get brandColorStream =>
      instanceFrontendConfigurationsStream.map(
        (instanceFrontendConfigurations) =>
            instanceFrontendConfigurations?.brandColor,
      );
}

extension IInstanceFrontendConfigurationsLocalPreferenceBlocExtension
    on IUnifediApiFrontendConfigurations {
  Color? get brandColor {
    var brandColorString = brandHexColor;
    if (brandColorString != null) {
      try {
        return Color(
          _hexStringToHexInt(
            brandColorString,
          ),
        );
        // ignore: avoid_catches_without_on_clauses
      } catch (e, stackTrace) {
        _logger.warning(
          () => 'failed to parse color $brandColorString',
          e,
          stackTrace,
        );

        return null;
      }
    } else {
      return null;
    }
  }

  String? get background => backgroundImage;
}

int _hexStringToHexInt(String hex) {
  var actualHex = hex;
  actualHex = actualHex.replaceFirst('#', '');
  // ignore: no-magic-number
  actualHex = actualHex.length == 6 ? 'ff' + actualHex : actualHex;

  // ignore: no-magic-number
  return int.parse(actualHex, radix: 16);
}
