import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/search/request_type/unifedi_api_search_request_type_sealed.dart';
import '../../../converter/sealed_converter.dart';

const _converter = UnifediApiSearchRequestTypePleromaConverter();

class UnifediApiSearchRequestTypePleromaConverter
    implements
        SealedConverter<UnifediApiSearchRequestType,
            PleromaApiSearchRequestType> {
  const UnifediApiSearchRequestTypePleromaConverter();

  @override
  UnifediApiSearchRequestType convertFrom(
    PleromaApiSearchRequestType item,
  ) =>
      item.map(
        accounts: (_) => UnifediApiSearchRequestType.accountsValue,
        hashtags: (_) => UnifediApiSearchRequestType.hashtagsValue,
        statuses: (_) => UnifediApiSearchRequestType.statusesValue,
      );

  @override
  PleromaApiSearchRequestType convertTo(
    UnifediApiSearchRequestType item,
  ) =>
      item.map(
        accounts: (_) => PleromaApiSearchRequestType.accountsValue,
        hashtags: (_) => PleromaApiSearchRequestType.hashtagsValue,
        statuses: (_) => PleromaApiSearchRequestType.statusesValue,
      );
}

extension PleromaApiSearchRequestTypeUnifediExtension
    on PleromaApiSearchRequestType {
  UnifediApiSearchRequestType toUnifediApiSearchRequestType() =>
      _converter.convertFrom(this);
}

extension UnifediApiSearchRequestTypePleromaExtension
    on UnifediApiSearchRequestType {
  PleromaApiSearchRequestType toPleromaApiSearchRequestType() =>
      _converter.convertTo(this);
}
