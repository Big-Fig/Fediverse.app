import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';

part 'auth_instance_list_model.g.dart';

@HiveType()
class AuthInstanceList extends IPreferencesObject {
  @HiveField(0)
  List<AuthInstance> instances;

  AuthInstanceList({this.instances});
}
