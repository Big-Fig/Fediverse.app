import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';

part 'instance_model.g.dart';

typedef InstanceCallback(Instance instance);

@HiveType()
class Instance extends IPreferencesObject {
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

  String get userAtHost => "$acct@$urlHost";
  Uri get url => Uri(scheme: urlSchema, host: urlHost);

  Instance({
    this.urlSchema,
    this.urlHost,
    this.acct,
    this.token,
    this.authCode,
    this.isPleromaInstance,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Instance &&
          runtimeType == other.runtimeType &&
          urlHost == other.urlHost &&
          acct == other.acct &&
          token == other.token &&
          authCode == other.authCode &&
          isPleromaInstance == other.isPleromaInstance;

  @override
  int get hashCode =>
      urlHost.hashCode ^
      acct.hashCode ^
      token.hashCode ^
      authCode.hashCode ^
      isPleromaInstance.hashCode;

  @override
  String toString() {
    return 'Instance{host: $urlHost, acct: $acct, token: $token,'
        ' authCode: $authCode, isPleromaInstance: $isPleromaInstance}';
  }
}
