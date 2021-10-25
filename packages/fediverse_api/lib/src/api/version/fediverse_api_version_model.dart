abstract class IFediverseApiVersion {
  int get major;

  int? get minor;

  int? get patch;

  int? get buildNumber;

  String? get commit;

  static int compare(IFediverseApiVersion a, IFediverseApiVersion b) {
    var majorCompareResult = a.major.compareTo(b.major);

    int result;
    if (majorCompareResult == 0) {
      var minor = a.minor ?? 0;
      var bMinor = b.minor ?? 0;

      var minorCompareResult = minor.compareTo(bMinor);

      if (minorCompareResult == 0) {
        var patch = a.patch ?? 0;
        var bPatch = b.patch ?? 0;

        var patchCompareResult = patch.compareTo(bPatch);

        if (patchCompareResult == 0) {
          var buildNumber = a.buildNumber ?? 0;
          var bBuildNumber = b.buildNumber ?? 0;

          var buildNumberCompareResult = buildNumber.compareTo(bBuildNumber);

          result = buildNumberCompareResult;
        } else {
          result = patchCompareResult;
        }
      } else {
        result = minorCompareResult;
      }
    } else {
      result = majorCompareResult;
    }

    return result;
  }
}
