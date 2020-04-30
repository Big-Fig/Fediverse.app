import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';

abstract class ITimelineTabBloc extends Disposable {
  IPaginationListWithNewItemsBloc<PaginationPage<IStatus>, IStatus>
      paginationListWithNewItemsBloc;
}
