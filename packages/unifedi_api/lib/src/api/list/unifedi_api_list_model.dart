import '../unifedi_api_model.dart';
import 'replies_policy_type/unifedi_api_card_replies_policy_type_sealed.dart';

abstract class IUnifediApiList implements IUnifediApiResponse {
  String get id;

  String get title;

  String? get repliesPolicy;
}

extension IUnifediApiListExtension on IUnifediApiList {
  UnifediApiListRepliesPolicyType? get repliesPolicyAsUnifediApi {
    var repliesPolicy = this.repliesPolicy;

    return repliesPolicy != null
        ? UnifediApiListRepliesPolicyType.fromStringValue(repliesPolicy)
        : null;
  }
}
