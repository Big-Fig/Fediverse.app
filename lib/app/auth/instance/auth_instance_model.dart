import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:fedi/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

part 'auth_instance_model.g.dart';

@HiveType()
class AuthInstance extends IPreferencesObject {
  @HiveField(0)
  String urlSchema;
  @HiveField(1)
  String urlHost;
  @HiveField(2)
  String acct;
  @HiveField(3)
  PleromaOAuthToken token;
  @HiveField(4)
  String authCode;

  @HiveField(5)
  bool isPleromaInstance;

  @HiveField(6)
  PleromaClientApplication application;

  @HiveField(7)
  PleromaInstance info;

  String get userAtHost => "$acct@$urlHost";

  Uri get url => Uri(scheme: urlSchema, host: urlHost);

  AuthInstance({
    this.urlSchema,
    this.urlHost,
    this.acct,
    this.token,
    this.authCode,
    this.isPleromaInstance,
    this.application,
    this.info,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AuthInstance &&
              runtimeType == other.runtimeType &&
              urlSchema == other.urlSchema &&
              urlHost == other.urlHost &&
              acct == other.acct &&
              token == other.token &&
              authCode == other.authCode &&
              isPleromaInstance == other.isPleromaInstance &&
              application == other.application &&
              info == other.info;

  @override
  int get hashCode =>
      urlSchema.hashCode ^
      urlHost.hashCode ^
      acct.hashCode ^
      token.hashCode ^
      authCode.hashCode ^
      isPleromaInstance.hashCode ^
      application.hashCode ^
      info.hashCode;

  @override
  String toString() {
    return 'Instance{host: $urlHost, acct: $acct, '
        'token: $token,'
        'application: $application,'
        'instance: $info,'
        ' authCode: $authCode, isPleromaInstance: $isPleromaInstance}';
  }

  bool isInstanceWithHostAndAcct(
          {@required String host, @required String acct}) =>
      this.acct == acct && urlHost == host;
}
