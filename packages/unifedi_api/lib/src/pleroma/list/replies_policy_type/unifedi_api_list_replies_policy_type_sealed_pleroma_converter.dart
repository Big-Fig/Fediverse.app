import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/list/replies_policy_type/unifedi_api_card_replies_policy_type_sealed.dart';
import '../../../converter/sealed_converter.dart';

const _converter = UnifediApiListRepliesPolicyTypePleromaConverter();

class UnifediApiListRepliesPolicyTypePleromaConverter
    implements
        SealedConverter<UnifediApiListRepliesPolicyType,
            PleromaApiListRepliesPolicyType> {
  const UnifediApiListRepliesPolicyTypePleromaConverter();

  @override
  UnifediApiListRepliesPolicyType convertFrom(
    PleromaApiListRepliesPolicyType item,
  ) =>
      item.map(
        list: (_) => UnifediApiListRepliesPolicyType.listValue,
        followed: (_) => UnifediApiListRepliesPolicyType.followedValue,
        none: (_) => UnifediApiListRepliesPolicyType.noneValue,
        unknown: (value) => UnifediApiListRepliesPolicyType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  PleromaApiListRepliesPolicyType convertTo(
    UnifediApiListRepliesPolicyType item,
  ) =>
      item.map(
        list: (_) => PleromaApiListRepliesPolicyType.listValue,
        followed: (_) => PleromaApiListRepliesPolicyType.followedValue,
        none: (_) => PleromaApiListRepliesPolicyType.noneValue,
        unknown: (value) => PleromaApiListRepliesPolicyType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension PleromaApiListRepliesPolicyTypeUnifediExtension
    on PleromaApiListRepliesPolicyType {
  UnifediApiListRepliesPolicyType toUnifediApiListRepliesPolicyType() =>
      _converter.convertFrom(this);
}

extension UnifediApiListRepliesPolicyTypePleromaExtension
    on UnifediApiListRepliesPolicyType {
  PleromaApiListRepliesPolicyType toPleromaApiListRepliesPolicyType() =>
      _converter.convertTo(this);
}
