import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension IPleromaListExtension on IUnifediApiList {
  CustomList toCustomList() {
    if (this is CustomList) {
      return this as CustomList;
    } else {
      return CustomList(
        remoteId: id,
        title: title,
      );
    }
  }
}

extension ICustomListExtension on ICustomList {
  UnifediApiList toPleromaList() {
    if (this is UnifediApiList) {
      return this as UnifediApiList;
    } else {
      return UnifediApiList(
        id: remoteId,
        title: title,
      );
    }
  }
}
