enum ConfigFlavor {
  prod,
  dev,
}

const _prodConfigFlavorJsonValue = 'prod';
const _devConfigFlavorJsonValue = 'dev';

extension ConfigFlavorExtension on ConfigFlavor {
  String toJsonValue() {
    String result;

    switch (this) {
      case ConfigFlavor.prod:
        result = _prodConfigFlavorJsonValue;
        break;
      case ConfigFlavor.dev:
        result = _devConfigFlavorJsonValue;
        break;
    }

    return result;
  }
}

extension PleromaApiVisibilityStringExtension on String {
  ConfigFlavor? toConfigFlavor() {
    ConfigFlavor? result;

    switch (this) {
      case _prodConfigFlavorJsonValue:
        result = ConfigFlavor.prod;
        break;
      case _devConfigFlavorJsonValue:
        result = ConfigFlavor.dev;
        break;
      // cant parse
      default:
        result = null;
        break;
    }

    return result;
  }
}
