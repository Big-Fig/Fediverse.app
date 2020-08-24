import 'package:fedi/app/hashtag/list/hashtag_list_widget.dart';
import 'package:flutter/widgets.dart';

class SearchHashtagsPaginationListWidget extends StatelessWidget {
  const SearchHashtagsPaginationListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HashtagListWidget();
  }
//  const SearchHashtagsPaginationListWidget(
//      {Key key,
//      Widget header,
//      bool forceFirstItemPadding = false,
//      Widget footer,
//      bool alwaysShowHeader,
//      bool alwaysShowFooter,
//      @required bool needWatchLocalRepositoryForUpdates})
//      : super(
//            key: key,
//            header: header,
//            footer: footer,
//            needWatchLocalRepositoryForUpdates:
//                needWatchLocalRepositoryForUpdates,
//            forceFirstItemPadding: forceFirstItemPadding,
//            alwaysShowFooter: alwaysShowFooter,
//            alwaysShowHeader: alwaysShowHeader);
//
//  @override
//  IPaginationListBloc<PaginationPage<IHashtags>, IHashtags>
//      retrievePaginationListBloc(BuildContext context,
//          {@required bool listen}) {
//    var timelinePaginationListBloc =
//        Provider.of<IPaginationListBloc<PaginationPage<IHashtags>, IHashtags>>(
//            context,
//            listen: listen);
//    return timelinePaginationListBloc;
//  }
}
