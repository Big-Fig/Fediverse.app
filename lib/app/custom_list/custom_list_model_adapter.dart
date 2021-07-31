import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

extension IPleromaListExtension on IPleromaApiList {
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
  PleromaApiList toPleromaList() {
    if (this is PleromaApiList) {
      return this as PleromaApiList;
    } else {
      return PleromaApiList(
        id: remoteId,
        title: title,
      );
    }
  }
}
