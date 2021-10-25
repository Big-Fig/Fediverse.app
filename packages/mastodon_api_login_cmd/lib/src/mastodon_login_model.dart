import 'package:freezed_annotation/freezed_annotation.dart';

part 'mastodon_login_model.freezed.dart';

@freezed
class MastodonLoginCredentials with _$MastodonLoginCredentials {
  factory MastodonLoginCredentials({
    required String instance,
    required String user,
    required String password,
    required String scopes,
  }) = _MastodonLoginCredentials;
}
