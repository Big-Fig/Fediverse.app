import 'package:freezed_annotation/freezed_annotation.dart';

part 'pleroma_login_model.freezed.dart';

@freezed
class PleromaLoginCredentials with _$PleromaLoginCredentials {
  factory PleromaLoginCredentials({
    required String instance,
    required String user,
    required String password,
    required String scopes,
  }) = _PleromaLoginCredentials;
}
