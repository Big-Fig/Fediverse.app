import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../api/captcha/unifedi_api_captcha_model.dart';
import 'type/unifedi_api_captcha_type_sealed_pleroma_converter.dart';

part 'unifedi_api_captcha_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_captcha_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiCaptchaPleromaAdapter
    with _$UnifediApiCaptchaPleromaAdapter
    implements IUnifediApiCaptcha {
  const UnifediApiCaptchaPleromaAdapter._();
  const factory UnifediApiCaptchaPleromaAdapter(
    @HiveField(0) PleromaApiCaptcha value,
  ) = _UnifediApiCaptchaPleromaAdapter;

  @override
  String get type =>
      value.typeAsPleromaApi.toUnifediApiCaptchaType().stringValue;

  @override
  int? get secondsValid => value.secondsValid;

  @override
  String? get token => value.token;

  @override
  String? get url => value.url;
  @override
  String? get answerData => value.answerData;
  factory UnifediApiCaptchaPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiCaptchaPleromaAdapterFromJson(json);
}

extension PleromaApiCaptchaUnifediExtension on IPleromaApiCaptcha {
  UnifediApiCaptchaPleromaAdapter toUnifediApiCaptchaPleromaAdapter() =>
      UnifediApiCaptchaPleromaAdapter(
        toPleromaApiCaptcha(),
      );
}

extension PleromaApiCaptchaUnifediListExtension on List<IPleromaApiCaptcha> {
  List<UnifediApiCaptchaPleromaAdapter>
      toUnifediApiCaptchaPleromaAdapterList() => map(
            (item) => item.toUnifediApiCaptchaPleromaAdapter(),
          ).toList();
}
