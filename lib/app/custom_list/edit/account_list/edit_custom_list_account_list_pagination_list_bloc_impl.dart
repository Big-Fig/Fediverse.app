import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/custom_list/edit/account_list/edit_custom_list_account_list_pagination_list_bloc.dart';
import 'package:fedi/pagination/list/edit/edit_pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';

class EditCustomListAccountListPaginationListBloc
    extends EditPaginationListBloc<PaginationPage<IAccount>, IAccount>
    implements IEditCustomListAccountListPaginationListBloc {
  EditCustomListAccountListPaginationListBloc({
    required IPaginationListBloc<PaginationPage<IAccount>, IAccount>
        paginationListBloc,
  }) : super(
          paginationListBloc: paginationListBloc,
          itemEquality: (IAccount a, IAccount b) => a.remoteId == b.remoteId,
        );
}
