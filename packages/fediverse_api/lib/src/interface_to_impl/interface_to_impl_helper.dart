abstract class InterfaceToImplHelper {
  static T interfaceToImpl<T extends K, K>(
    K interfaceObj,
    T Function(K interfaceObj) converter, {
    required bool forceNewObject,
  }) =>
      interfaceObj is T && !forceNewObject
          ? interfaceObj
          : converter(interfaceObj);

  static List<T> interfaceListToImplList<T extends K, K>(
    List<K> interfaceObjList,
    T Function(K interfaceObj) converter, {
    required bool forceNewObject,
  }) =>
      interfaceObjList is List<T> && !forceNewObject
          ? interfaceObjList
          : interfaceObjList
              .map(
                (interfaceObj) => interfaceToImpl(
                  interfaceObj,
                  converter,
                  forceNewObject: forceNewObject,
                ),
              )
              .toList();
}
