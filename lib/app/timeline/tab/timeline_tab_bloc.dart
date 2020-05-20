import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';

abstract class ITimelineTabBloc extends Disposable {
  IPaginationListWithNewItemsBloc<PaginationPage<IStatus>, IStatus>
      paginationListWithNewItemsBloc;
}
