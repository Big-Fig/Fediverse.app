import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'hashtag_model.freezed.dart';

abstract class IHashtag {
  String get name;

  String? get url;

  int? get statusesCount;

  IUnifediApiTagHistory? get history;
}

@freezed
class Hashtag with _$Hashtag implements IHashtag {
  const Hashtag._();
  const factory Hashtag({
    @override required String name,
    @override required IUnifediApiTagHistory? history,
    @override required String? url,
  }) = _Hashtag;

  @override
  // TODO: implement statusesCount
  int? get statusesCount => null;
}
