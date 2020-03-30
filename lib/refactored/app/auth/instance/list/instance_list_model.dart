import 'package:fedi/refactored/app/auth/instance/instance_model.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';

part 'instance_list_model.g.dart';

@HiveType()
class InstanceList extends IPreferencesObject {
  @HiveField(0)
  List<Instance> instances;

  InstanceList({this.instances});
}
