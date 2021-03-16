import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';

extension IPleromaListExtension on IPleromaList {
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
  PleromaList toPleromaList() {
    if (this is PleromaList) {
      return this as PleromaList;
    } else {
      return PleromaList(
        id: remoteId,
        title: title,
      );
    }
  }
}
