import '../fediverse_api_version_model.dart';

abstract class IFediverseApiVersionRange {
  IFediverseApiVersion? get min;
  IFediverseApiVersion? get max;

  bool get minInclusive;

  bool get maxInclusive;
}

extension IFediverseApiVersionRangeExtension on IFediverseApiVersionRange {
  bool isVersionInRange(IFediverseApiVersion version) {
    var min = this.min;
    var max = this.max;
    bool minInRange;
    bool maxInRange;

    if (min != null) {
      var compareTo = IFediverseApiVersion.compare(version, min);
      minInRange = minInclusive ? compareTo >= 0 : compareTo > 0;
    } else {
      minInRange = true;
    }
    if (max != null) {
      var compareTo = IFediverseApiVersion.compare(version, max);
      maxInRange = maxInclusive ? compareTo >= 0 : compareTo > 0;
    } else {
      maxInRange = true;
    }

    return minInRange && maxInRange;
  }
}
