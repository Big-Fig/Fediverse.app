import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_account_featured_hashtag_model.freezed.dart';

abstract class IMyAccountFeaturedHashtag {
  String? get remoteId;

  String get name;

  int? get statusesCount;

  DateTime? get lastStatusAt;
}

@freezed
class MyAccountFeaturedHashtag
    with _$MyAccountFeaturedHashtag
    implements IMyAccountFeaturedHashtag {
  const factory MyAccountFeaturedHashtag({
    required String? remoteId,
    required String name,
    required int? statusesCount,
    required DateTime? lastStatusAt,
  }) = _MyAccountFeaturedHashtag;
}
