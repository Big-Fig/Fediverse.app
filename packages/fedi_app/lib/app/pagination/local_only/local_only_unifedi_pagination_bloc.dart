import 'package:fedi_app/pagination/local_only/local_only_pagination_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';

abstract class ILocalOnlyUnifediPaginationBloc<TItem>
    implements ILocalOnlyPaginationBloc<PaginationPage<TItem>, TItem> {}
