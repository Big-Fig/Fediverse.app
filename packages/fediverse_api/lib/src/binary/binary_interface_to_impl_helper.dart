import 'dart:typed_data';

import '../interface_to_impl/interface_to_impl_helper.dart';
import 'binary_model.dart';

abstract class BinaryInterfaceToImplHelper {
  static T interfaceToImpl<T extends K, K extends IBinaryObj>(
    K interfaceObj,
    T Function(Uint8List bytes) fromBytes, {
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        interfaceObj,
        (K obj) => fromBytes(
          obj.toBytes(),
        ),
        forceNewObject: forceNewObject,
      );

  static List<T> interfaceListToImplList<T extends K, K extends IBinaryObj>(
    List<K> interfaceObjList,
    T Function(Uint8List bytes) fromBytes, {
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        interfaceObjList,
        (K obj) => fromBytes(
          obj.toBytes(),
        ),
        forceNewObject: forceNewObject,
      );
}
