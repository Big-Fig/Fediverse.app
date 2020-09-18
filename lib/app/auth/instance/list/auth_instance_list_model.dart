import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';

part 'auth_instance_list_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
@HiveType()
// @HiveType(typeId: -32 + 49)
class AuthInstanceList extends IPreferencesObject {
  @HiveField(0)
  final List<AuthInstance> instances;

  AuthInstanceList({this.instances});
}
