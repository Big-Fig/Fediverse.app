import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/rest/error/exception/unifedi_api_rest_error_exception.dart';
import '../../../../api/rest/error/unifedi_api_rest_error_model.dart';
import '../unifedi_api_rest_error_model_pleroma_adapter.dart';

part 'unifedi_api_rest_error_exception_pleroma_adapter.freezed.dart';

@freezed
class UnifediApiRestErrorExceptionPleromaAdapter
    with _$UnifediApiRestErrorExceptionPleromaAdapter
    implements IUnifediApiRestErrorException {
  const UnifediApiRestErrorExceptionPleromaAdapter._();

  const factory UnifediApiRestErrorExceptionPleromaAdapter(
    PleromaApiRestErrorException value,
  ) = _UnifediApiRestErrorExceptionPleromaAdapter;

  @override
  IRestResponseError get restResponseError => value.restResponseError;

  @override
  IUnifediApiRestError get unifediError =>
      value.pleromaError.toUnifediApiRestErrorPleromaAdapter();

  @override
  IMastodonApiRestError get mastodonError => value.mastodonError;

  @override
  IPleromaApiRestError get pleromaError => value.pleromaError;
}

extension PleromaApiRestErrorExceptionUnifediExtension
    on IPleromaApiRestErrorException {
  UnifediApiRestErrorExceptionPleromaAdapter
      toUnifediApiRestErrorExceptionPleromaAdapter() =>
          UnifediApiRestErrorExceptionPleromaAdapter(
            toPleromaApiRestErrorException(),
          );
}

extension PleromaApiRestErrorExceptionUnifediListExtension
    on List<IPleromaApiRestErrorException> {
  List<UnifediApiRestErrorExceptionPleromaAdapter>
      toUnifediApiRestErrorExceptionPleromaAdapterList() => map(
            (item) => item.toUnifediApiRestErrorExceptionPleromaAdapter(),
          ).toList();
}
