import 'package:json_annotation/json_annotation.dart';

part 'captcha.g.dart';

@JsonSerializable()
class Captcha {
    String answerData;
    String token;
    String type;
    String url;

    Captcha({
        this.answerData,
        this.token,
        this.type,
        this.url,
    });

    factory Captcha.fromJson(Map<String, dynamic> json) =>
      _$CaptchaFromJson(json);
}
