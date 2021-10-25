import '../../../pleroma_api_model.dart';

abstract class IPleromaApiInstancePollLimits
    implements IPleromaApiResponsePart {
  static const Duration defaultMinPollExpiration = Duration(minutes: 10);
  static const Duration defaultMaxPollExpiration = Duration(days: 365);
  static const Duration defaultPollExpiration = Duration(days: 1);
  static const int defaultMaxPollOptions = 20;
  static const int defaultMaxOptionChars = 256;

  int? get maxExpiration;

  int? get maxOptionChars;

  int? get maxOptions;

  int? get minExpiration;
}

extension PleromaApiInstancePollLimitsExtension
    on IPleromaApiInstancePollLimits {
  Duration get minExpirationDurationOrDefault {
    var expiration = minExpiration;

    return expiration != null
        ? Duration(seconds: expiration)
        : IPleromaApiInstancePollLimits.defaultMinPollExpiration;
  }

  Duration get maxExpirationDurationOrDefault {
    var expiration = maxExpiration;

    return expiration != null
        ? Duration(seconds: expiration)
        : IPleromaApiInstancePollLimits.defaultMaxPollExpiration;
  }

  int get maxOptionsOrDefault =>
      maxOptions ?? IPleromaApiInstancePollLimits.defaultMaxPollOptions;

  int get maxOptionCharsOrDefault =>
      maxOptionChars ?? IPleromaApiInstancePollLimits.defaultMaxOptionChars;
}
