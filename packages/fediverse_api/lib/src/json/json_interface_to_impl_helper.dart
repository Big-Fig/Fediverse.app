import '../interface_to_impl/interface_to_impl_helper.dart';
import 'json_model.dart';

abstract class JsonInterfaceToImplHelper {
  static T interfaceToImpl<T extends K, K extends IJsonObj>(
    K interfaceObj,
    T Function(Map<String, dynamic> json) fromJson, {
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        interfaceObj,
        (K obj) => fromJson(
          obj.toJson(),
        ),
        forceNewObject: forceNewObject,
      );

  static List<T> interfaceListToImplList<T extends K, K extends IJsonObj>(
    List<K> interfaceObjList,
    T Function(Map<String, dynamic> json) fromJson, {
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        interfaceObjList,
        (K obj) => fromJson(
          obj.toJson(),
        ),
        forceNewObject: forceNewObject,
      );
}
