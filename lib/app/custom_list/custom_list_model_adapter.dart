import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';

ICustomList mapRemoteListToLocalCustomList(IPleromaList pleromaList) => CustomList(
      remoteId: pleromaList.id,
      title: pleromaList.title,
    );
