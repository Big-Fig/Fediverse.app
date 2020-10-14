import 'package:package_info/package_info.dart';

class FediPackageInfoHelper {
  static const prodPackageId = "com.fediverse.app";
  static const devPackageId = "com.fediverse.app2";

  static const prodAppName = "Fedi";
  static const devAppName = "Fedi2(dev)";

  static PackageInfo _packageInfo;

  static Future<String> getAppName() async {
    if (await isProdPackageId()) {
      return prodAppName;
    } else if (await isDevPackageId()) {
      return devAppName;
    } else {
      var packageName = await getPackageId();
      throw "Invalid package name ${packageName}";
    }
  }

  static Future<String> getPackageId() async {
    await _calculatePackageInfo();
    return _packageInfo.packageName;
  }

  static Future<bool> isProdPackageId() async {
    await _calculatePackageInfo();
    return (await getPackageId()) == prodPackageId;
  }

  static Future<bool> isDevPackageId() async {
    await _calculatePackageInfo();
    return (await getPackageId()) == devPackageId;
  }

  static Future _calculatePackageInfo() async {
    _packageInfo ??= await PackageInfo.fromPlatform();
  }
}
